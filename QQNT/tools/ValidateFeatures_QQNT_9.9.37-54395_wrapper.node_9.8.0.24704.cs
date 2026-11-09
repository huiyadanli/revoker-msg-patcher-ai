using RevokeMsgPatcher;
using RevokeMsgPatcher.Matcher;
using RevokeMsgPatcher.Model;
using RevokeMsgPatcher.Utils;
using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Cryptography;

internal static class FeatureValidation
{
    private static void Require(bool condition, string message)
    {
        if (!condition) throw new InvalidOperationException(message);
    }

    private static string Hash(byte[] data)
    {
        using (SHA256 sha = SHA256.Create())
            return BitConverter.ToString(sha.ComputeHash(data)).Replace("-", "").ToLowerInvariant();
    }

    private static int Main(string[] args)
    {
        try
        {
            string path = args[0];
            string version = FileVersionInfo.GetVersionInfo(path).FileVersion;
            Require(version == "9.8.0.24704", "Unexpected PE file version");
            CommonModifyInfo rule = new JsonData().QQNT().FileCommonModifyInfos["wrapper.node"].First(info =>
                VersionUtil.Compare(version, info.StartVersion) > 0 &&
                VersionUtil.Compare(version, info.EndVersion) <= 0);
            Require(rule.ReplacePatterns.Count == 2, "Expected group and c2c features");
            byte[] original = File.ReadAllBytes(path);
            Require(Hash(original) == "fed532ad58d2404dcedf2858554e8fa52a5f4e65b271c008d2faca4011d7d4a2", "Unexpected original hash");
            int[] offsets = { 0x2774968, 0x2771440 };
            for (int i = 0; i < rule.ReplacePatterns.Count; i++)
            {
                ReplacePattern feature = rule.ReplacePatterns[i];
                int[] found = FuzzyMatcher.MatchAll(original, feature.Search);
                Require(found.Length == 1 && found[0] == offsets[i], "Feature match is not unique at the verified handler");
                Require(feature.Search.Length == feature.Replace.Length, "Replacement changes the block length");
                Console.WriteLine("Feature {0}: unique match 0x{1:X}, length {2}", i, found[0], feature.Search.Length);
            }
            var changes = ModifyFinder.FindChanges(path, rule.ReplacePatterns);
            Require(changes.Count == 2, "Expected exactly two replacement blocks");
            byte[] candidate = (byte[])original.Clone();
            foreach (Change change in changes)
                for (int i = 0; i < change.Content.Length; i++)
                    if (change.Content[i] != FuzzyMatcher.wildcard)
                        candidate[(int)change.Position + i] = change.Content[i];
            string candidateHash = Hash(candidate);
            Require(candidateHash == "f5e20cb7129142dac22b962ce253cfd0a955f52a3c20ad807440a5b0fa3adab3", "Candidate hash mismatch");
            int count = 0;
            for (int i = 0; i < original.Length; i++) if (original[i] != candidate[i]) count++;
            Require(count == 8, "Expected exactly eight modified bytes");
            foreach (ReplacePattern feature in rule.ReplacePatterns)
            {
                Require(FuzzyMatcher.MatchAll(candidate, feature.Search).Length == 0, "Original feature remains");
                Require(FuzzyMatcher.MatchAll(candidate, feature.Replace).Length == 1, "Patched feature is not unique");
            }
            Console.WriteLine("PE version: " + version);
            Console.WriteLine("Selected range: (" + rule.StartVersion + ", " + rule.EndVersion + "]");
            Console.WriteLine("Candidate SHA256: " + candidateHash);
            Console.WriteLine("PASS: actual JsonData selection, unique features, two blocks, eight changed bytes, patched-feature recognition; target file not written");
            return 0;
        }
        catch (Exception error)
        {
            Console.Error.WriteLine(error);
            return 1;
        }
    }
}
