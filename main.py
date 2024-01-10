

SUPPORTED_FORMATS = ['jpg', 'jpeg', 'png', 'tif', 'gif']


def test2():
    print('running test2')
    import glob
    import os
    import tkinter
    from PIL import Image, ImageTk

    photos_directory = '/media/spraders/SPRADERS'
    if not os.path.exists(photos_directory):
        print('Media drive Not Found')
        return

    root = tkinter.Tk()
    root.geometry('200x200')

    photos = [
        photo for photo in glob.glob(f'{photos_directory}/*.*')
        if photo.split('.')[-1] in SUPPORTED_FORMATS
    ]

    for photo in photos:
        print(photo)

    loaded_photos = [
        ImageTk.PhotoImage(Image.open(photo))
        for photo in photos
    ]

    for photo in loaded_photos:
        print(photo)

    root = tkinter.Tk()
    root.geometry('200x200')

    label = tkinter.Label()
    label.pack()
    label.config(image=loaded_photos[0])
    root.mainloop()
    x = 1


def move_photos():
    global x
    if x == 4:
        x = 1
            
        


def test():
    import os
    import time

    import photoshow

    print('what in the world')

    photos_directory = '/media/spraders/SPRADERS'


    photoshow.present(photos_directory, delay_time=5)

    print(photoshow)
    print('here i am')

    # time.sleep(100)

if __name__ == '__main__':
    test2()
