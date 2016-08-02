import os
import imghdr

class Stack:
    def __init__(self: 'Stack', data=None) -> None:
        '''A new empty Stack.'''
        if not data: self._data = []
        else: self._data = data

    def pop(self: 'Stack') -> object:
        '''Remove and return the top item.'''
        return self._data.pop(0)

    def is_empty(self: 'Stack') -> bool:
        '''Return whether the stack is empty.'''
        return len(self._data) == 0

    def push(self: 'Stack', o: 'object') -> None:
        '''Place o on top of the stack.'''
        self._data.append(o)

    def __repr__(self):
        s = "["
        dup = Stack(self._data[:])
        while not dup.is_empty():
            s += dup.pop() + ','
        s += "]"
        return s


def listing_directories(file_path:str) -> None:
    '''
    Stores all files (pictures and folders) in the file path

    :param file_path: string
    :return: None
    '''
    picture = Stack()
    dir_lst = Stack()
    directory = (os.listdir(file_path))
    for file in directory:
        if os.path.isfile(file_path + file):

            if imghdr.what(file_path + file):
                picture.push(file) #store picture into the stack
        else:
            dir_lst.push(file) #store folder name into the stack

    if not picture.is_empty():
        create_page(file_path, picture)
    if not dir_lst.is_empty():
        while not dir_lst.is_empty():
            new_path = file_path + dir_lst.pop() + "/"
            listing_directories(new_path)


def create_page(file_path: str, picture: 'Stack') -> None:
    '''
    Creates web page that links all the images in the folder

    :param file_path: string
    :param picture: Stack
    :return: None
    '''
    file = file_path.strip("/").split('/')
    file_name = file_path + file[-1] + ".html" #the whole file path including the file name
    basic_layout_beginning = "<html>\n<head>\n<title>" + file[-1] + "</title>\n</head>\n<body>\n<center>"
    basic_layout_ending = "</center>\n</body>\n</html>"
    handle = open(file_name, 'w')
    handle.write(basic_layout_beginning)
    while not picture.is_empty(): #go through every picture in the directory
        handle.write("<img src = '" + picture.pop() + "'>\n")
    handle.write(basic_layout_ending)
    print("Wrote: " + file_name)
    handle.close()


#main program#################################################################################################
file_path = input("Please type in the file path to the folder you wish to create a web page for: ")
while not os.path.exists(file_path) or not os.path.isdir(file_path):
    print("INVALID FILE PATH PLEASE TRY AGAIN\n")
    print("NOTE: You must input a valid file path to a directory and not a file so please check if you have spelt the path correctly\n")
    print("NOTE: File path must use '/' and not '\'")
    file_path = input("Please type in the file path to the folder you wish to create a web page for: ")

file_path = file_path.strip('/') + '/' #stips away any '/' just in case the user adds '/' to the end of their input
listing_directories(file_path)
