
import sys
import markdown
import jinja2

def do(filename_in, filename_out):

    with open(filename_in) as f:
        s = f.read()

    md = markdown.Markdown(extensions=['toc'])

    s1 = md.convert(s)

    print(s1)

    env = jinja2.Environment(
            loader=jinja2.FileSystemLoader('.')
            )

    s2 = "{% extends 'template.html' %}{% block body %}\n" + s1 + "{% endblock %}\n"

    temp = env.from_string(s2)

    with open(filename_out, "w") as f:
        f.write(temp.render())


print(sys.argv)

do(sys.argv[1], sys.argv[2])



