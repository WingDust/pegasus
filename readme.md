
## 删除 submodule 
删除项目源码子目录
删除 .gitmodules 文件中 submodule 的信息
删除 .git/config 文件中 submodule 的信息
删除 .git/modules/ 目录下 sumodule 的子目录
应用修改

- `$ git submodule [--quiet] deinit [-f|--force] (--all|[--] <path>…​)`
- `$ git submodule deinit -f theme/path/`

- `git submodule add https://github.com/manateelazycat/color-rg.git .\site-lisp\extension\color-rg`
