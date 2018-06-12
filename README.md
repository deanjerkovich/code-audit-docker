# code-audit-docker

### What is this?

- a docker image running ubuntu with tools for code audit
- C/C++ primarily, probably works for other languages

### Get it running

##### Step 1: get docker

Install docker.

##### Step 2: get the image and launch

Make sure you substitute in your `~/your_codebase` which is the directory containing your code you're planning to audit

```
git clone https://blah
cd code-audit-docker
docker build -t codereview .
docker run -it -v ~/your_codebase:/root/code_review codereview
```

##### Step 3: take a look at your shiny new tools

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

