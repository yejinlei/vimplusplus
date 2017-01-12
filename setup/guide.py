#coding:utf-8#
import os

class Guide:

    def replace(self):
        pass

    def update(self):
        pass

    def download(self):
        pass

    def test(self):
        pass

   
class LinuxGuide(Guide):
    def test(self):
        print 'test'

if __name__ == "__main__":
    LinuxGuide().test()
    
