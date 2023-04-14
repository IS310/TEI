
def WordFileToList(filename: str)->list[str]:
    file = open(filename, 'r')
    ans = file.readlines()
    for i in range(len(ans)):
        ans[i] = ans[i][:-1]
    file.close()
    return ans

def ListToWordFile(filename: str, l: list[str]):
    file = open(filename, 'w')
    for word in l:
        file.write(word + '\n');
    file.close()
    
class PrefixTree:

    class Node:
        def __init__(self):
            self.end_count = 0
            self.next = [None for i in range(26)]

    def __init__(self):

        self.__root = PrefixTree.Node()

    def add(self, word):
        curr = self.__root
        ord_a = ord('a')
        for c in word:
            idx = ord(c) - ord_a
            if (idx < 0 or idx > 25):
                continue
            # print(curr.next)
            if (curr.next[idx] is None):
                curr.next[idx] = PrefixTree.Node()
            curr = curr.next[idx]
        curr.end_count += 1

    def getAllHelper(root, words, path, limit) -> bool:
        if (root.end_count > 0):
            words.append(str(path))
            if (limit != 0 and len(path) > limit):
                # print(path)
                return True
        flag = False
        for i in range(26):
            if (root.next[i] != None):
                flag = PrefixTree.getAllHelper(root.next[i], words, path + chr(ord('a') + i), limit)
                if (flag):
                    break
        # path = path[:-1]
        if (limit != 0 and len(path) > limit):
            return True
        else:
            return False

    def getAll(self, limit = 0):
        words = []
        path = ""
        stk = []
        PrefixTree.getAllHelper(self.__root, words, path, limit)
        return words




l = WordFileToList("./Words/CommonWords.txt")
t = PrefixTree()
for word in l:
    t.add(word)
# Testing
# t.add("accompany")
# t.add("accompanied")
# t.add("ab")
# t.add("ac")
# print(t.getAll(limit=4))
ListToWordFile("./Words/CleanedWords.txt", t.getAll(limit=4))
