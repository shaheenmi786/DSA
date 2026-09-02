# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: Optional[ListNode]
        :type l2: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        dummy=ListNode(0) #it holds the place where we start
        current=dummy #it moves down to next after answer digit
        carry=0 #it starts at (0 or 1)
        while l1 or l2 or carry:
            val1=l1.val if l1 else 0
            val2=l2.val if l2 else 0

            total=val1+val2+carry #7+5+0=12
            carry=total//10 #12//10=1
            digit=total%10 #12%10=2 

            current.next=ListNode(digit) #we should attach to answer list
            current=current.next
            l1=l1.next if l1  else None #hence it goes next digit or goes none
            l2=l2.next if l2 else None
        return dummy.next




