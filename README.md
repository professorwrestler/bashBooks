# bashBooks

A terminal CRUD app written in bash for keeping track of the books I'm reading.

It's basically a big switch statement of options allowing for the creation, reading, updating,
and deleting of book titles and their authors. On first use, it'll create a books.txt
file that serves as a primitive database. From there, you can add and remove books to the file
as you please, leveraging sed and grep for the most important parts. Think of it as a CLI
alternative to Goodreads, minus all the ISBN functionality and social media stuff.
