import os
import re

import markdown

def process(s):
    
    m = re.search("\[.*\]\(([\/\w]*\.md)\)", s)

    if not m:
        print('no match')
        yield s
        return

    yield s[:m.start(0)]

    print()
    print(m.start(1), m.end(1))
    print(repr(s[m.start(1):m.end(1)]))
    print(repr(m.group(1)))

    yield from read(m.group(1))

    yield from process(s[m.end(0):])

def read(filename):

    h, t = os.path.split(filename)
    print(repr(h), t)

    if h:
        print(os.path.relpath(h))

    with open(filename) as f:

        s = f.read()

    return "".join(process(s))



def main():

    s = read("main.md")

    print(s)

    s1 = markdown.markdown(s)

    print(s1)

    with open("main.html", "w") as f:
        f.write(s1)

if __name__ == "__main__":
    main()

