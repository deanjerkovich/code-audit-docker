# code-audit-docker

### What is this?

- A docker image running ubuntu with tools for code audit
- A bunch of configs that *work for me*
- C/C++ primarily, probably works for other languages

### Get it running

##### Step 1: Get docker

[Install docker.](https://www.docker.com/get-docker)

##### Step 2: Get the image and launch

Make sure you substitute in your `~/your_codebase` which is the directory containing your code you're planning to audit

```
git clone https://github.com/deanjerkovich/code-audit-docker.git
cd code-audit-docker
docker build -t codereview .
docker run -it -v ~/your_codebase:/root/code_review codereview
```

##### Step 3: Take a look at your shiny new tools

- Move into the code review directory and launch tmux

```
cd /root/code_review
tmux
```

- tmux is great for managing your workspace. I use Ctrl-A as the tmux trigger. Try these:

```
Ctrl-a c        // new window
Ctrl-a [num]    // go to [num] window
Ctrl-a ,        // rename window
Ctrl-a |        // vertical split
Ctrl-a -        // horizontal split
Ctrl-a q [num]  // go to split number
Ctrl-a x        // exit window/split
```

- Fuzzy search over filenames and return the selected one: great for piping into other tools (see next)

```
fzf
```

- Fuzzy search over filenames and open the desired one in vim

```
vf
```

- create your ctags file in the root of the code directory

```
ctags -R .
```
now, whenever you're in a file in vim, `Ctrl-]` will take you to the definitions of that function/macro/whatever

## TODO EVERYTHING ELSE once I've used it for ages

