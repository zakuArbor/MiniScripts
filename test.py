import os
import imghdr

class Queue:
    def __init__(self: 'Queue', data=None) -> None:
        '''A new empty Queue.'''
        if not data: self._data = []
        else: self._data = data

    def pop(self: 'Queue') -> object:
        '''
        Remove and return the top item.
        Adds the top item to the removed Queue
        :return:
        '''
        return self._data.pop(0)

    def see_next(self: 'Queue') -> object:
        '''
        Allows you to see the current item on the list
        The name might be deceiving but for this function purpose, it is seeing the next item after the previous item has been removed
        :return: object
        '''
        return self._data[0]

    def is_empty(self: 'Queue') -> bool:
        '''Return whether the Queue is empty.'''
        return len(self._data) == 0

    def push(self: 'Queue', o: 'object') -> None:
        '''Place o on top of the Queue.'''
        self._data.append(o)

    def __repr__(self):
        s = "["
        dup = Queue(self._data[:])
        while not dup.is_empty():
            s += dup.pop() + ','
        s += "]"
        return s


def listing_directories(file_path:str, folders: 'Queue', previous:str) -> None:
    """
    Stores all files (pictures and folders) in the file path

    :param file_path: str
    :param folders: Queue
    :param previous: str
    :return: str - previous
    """
    picture = Queue()
    dir_lst = Queue()
    directory = (os.listdir(file_path))

    print("initial:" + previous + "\n")

    for file in directory:
        if os.path.isfile(file_path + file):

            if imghdr.what(file_path + file):
                picture.push(file) #store picture into the Queue
        else:
            dir_lst.push(file) #store folder name into the Queue
            folders.push(file_path + file) #store file path including the folder name

    if not picture.is_empty():
        previous = create_page(file_path, picture, folders, previous)
        print("after:" + previous)

    print("before send:" + previous)
    if not dir_lst.is_empty():
        print("test:" + previous)
        while not dir_lst.is_empty():
            print("sending:" + previous)
            new_path = file_path + dir_lst.pop() + "/"
            listing_directories(new_path, folders, previous)

    return previous


def create_page(file_path: str, picture: 'Queue', folders:'Queue', previous: 'str') -> str:
    """
    Creates web page that links all the images in the folder

    :param file_path: string
    :param picture: Queue
    :param folders: Queue
    :param previous: str
    :return: str - the file path of the webpage created
    """
    global orig_file_path

    print(previous)

    file = file_path.strip("/").split('/')
    file_name = file_path + file[-1] + ".html" #the whole file path including the file name
    basic_layout_beginning = "<html>\n<head>\n<title>" + file[-1] + "</title>\n</head>\n<body>\n<center>"
    basic_layout_ending = "</center>\n</body>\n</html>"

    handle = open(file_name, 'w')
    handle.write(basic_layout_beginning)
    while not picture.is_empty(): #go through every picture in the directory
        handle.write("<img src = '" + picture.pop() + "'>\n")

    if previous:
        handle.write("<a href = 'file:///" + previous + ".html'><b>PREVIOUS</b>\t\t</a>")
    else:
        if not folders.is_empty():
            folders.pop()
    if not folders.is_empty():
        next = folders.pop()
        next_name = next.split('/')
        handle.write("<a href = 'file:///" + next + '/' + next_name[-1] + ".html'><b>NEXT</b></a>")
    else:
        print(folders)
    handle.write(basic_layout_ending)
    handle.close()

    print("Wrote: " + file_name)
    return file_name


#main program#################################################################################################
file_path = input("Please type in the file path to the folder you wish to create a web page for: ")
while not os.path.exists(file_path) or not os.path.isdir(file_path):
    print("INVALID FILE PATH PLEASE TRY AGAIN\n")
    print("NOTE: You must input a valid file path to a directory and not a file so please check if you have spelt the path correctly\n")
    print("NOTE: File path must use '/' and not '\'")
    file_path = input("Please type in the file path to the folder you wish to create a web page for: ")

orig_file_path = file_path.strip('/') + '/' #stips away any '/' just in case the user adds '/' to the end of their input
webpage_lst = Queue() #for future development
folders = Queue()
listing_directories(orig_file_path, folders, '')
