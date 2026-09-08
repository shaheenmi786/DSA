class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        dict={}
        max_len=0
        start=0
        for end in range(len(s)):
            if s[end] in dict:
                start=max(start,dict[s[end]]+1)
            dict[s[end]]=end
            max_len=max(max_len,end-start+1)
        return max_len