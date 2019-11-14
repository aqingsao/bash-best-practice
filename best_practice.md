与其他编程语言相比，Shell可能是无法避开的一门语言，上手快、功能强是其最大的两个特点。然而如何书写健壮、可维护的脚本并非易事，本文给出十几条最佳实践，希望可以在30分钟的时间内让你快速掌握。
本文参考了网上的一些资料，同时考虑到兼容性。

# 写在前面
了解Bash版本很重，最新的Bash 5已于2019年初发布，但Linux上一般搭载bash 4.X，Mac OS X则由于Bash的License问题，仍停留在古老的3.2.X版本，并转向了Zsh。
通过`bash --version`快速了解bash版本。

#整体结构
1.【推荐】脚本第一行的shebang，使用#!/usr/bin/env bash 优于 #!/bin/bash
前者在不同系统上的移植性更好，会从用户定义的PATH中寻找bash解释器。

2.【推荐】使用`set -o errexit`、`set -o nounset`
	`set -o errexit`：确保一个命令失败时，脚本退出。
  `set -o pipefail`：  # don't hide errors within pipes

`set -o nounset`：不推荐使用。作用是变量未定义就报错，符合fail fast原则，但bash 3、bash 4存在不兼容问题。Bash 4
```bash  
	set -o nounset
	# var如果未定义，会报错误：@: unbound variable，符合fail-fast原则
  if [[ ${var} == "hello" ]];then
  	echo ${var}
  fi
```
3.【推荐】使用几个通用的魔鬼变量
```bash
	// magic variables for current file & dir
	declare -r __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	declare -r __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
	declare -r __base="$(basename ${__file} .sh)"
	declare -r __root="$(cd "$(dirname "${__dir}")" && pwd)"
```
4.【推荐】main函数作为脚本的入口
Shell一般是解释型语言，简单、灵活，提供main函数作为统一的入口，让代码更容易理解。

遵守这4条最佳实践，可以得到Bash脚本的通用结构，也可以作为一个模板。
```bash
	#!/usr/bin/env bash

	set -o errexit
	set -o pipefail
	#set -o nounset
	#set -o xtrace

	# magic variables for current file & dir
	declare -r __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	declare -r __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
	declare -r __base="$(basename ${__file} .sh)"
	declare -r __root="$(cd "$(dirname "${__dir}")" && pwd)"

	function main(){
	}
	main "${@}"
```

# 变量 #
1. 定义变量时，通过`local`尽量使用本地变量
示例：
```bash
	# 局部变量
	function func_name(){
		local local_var_name="value"
	}
```
而非
```bash
	# 全局变量
	function func_name(){
		var_name="value"
	}
```

2. 如需使用全局变量，通过`declare -r`尽量置为只读
示例：
```bash
	# 只读变量
	delcare -r readonly_var="value"
```
而非:
```bash
	# 可写变量
	readonly_var="value"
```

3. 变量名使用小写，除非需要导出为环境变量
示例：
```bash
	delcare -r var_name="value"
	export VAR_NAME="value"
```
而非:
```bash
	declare -r VAR_NAME="value"
	export var_name="value"
```

4. Bash支持的数据类型，显示声明其类型
示例：
```bash
	declare -a array_var=( "foo" "bar" )
	declare -i int_var=100
```

5. 变量引用时使用大括号，比如${var}，用于表达式判断时，使用双引号，比如"${var}"
与$var_app相比，${var}_app、${var_app}更清晰，可以避免歧义。

6. 表达式中引用变量时，总是用双引号括起来，比如"${var}"，尤其如果值包含空格或者分隔符时
示例：
```bash
	$ book="my book.txt"
	$ rm "${book}"
```
而非：
```bash
	$ book="my book.txt"
	$ rm $book
	rm: cannot remove `my': No such file or directory
	rm: cannot remove `book.txt': No such file or directory
```

7. 脚本中需要用到的全局变量，需提前并集中声明
示例：
```bash
	# 集中声明
	delcare -r readonly_var="value"
	delcare var_name="value"

	function main(){
	}
```

# 表达式
1. 条件判断使用[[]]而不是[]
`[`是一个传统的验证命令，比如文件是否存在、数据是否相等，但该命令存在一些问题，很容易导致结果非预期。但推荐使用升级的版本`[[`，ksh、bash、zsh都支持，可以用于字符串匹配。
```bash
$ var=''
$ [ $var = '' ] && echo True
-bash: [: =: unary operator expected
$ [ "$var" = '' ] && echo True
True
$ [[ $var = '' ]] && echo True
True
```

2. 三元操作符
```bash
$ var=a
$ [ "$var" > b ] && echo True || echo False
True
$ [[ "$var" > b ]] && echo True || echo False
False
```

# 基本数据结构 #
1. 数组

1. 字典Dict
Bash 4：内在支持dict功能
declare -A animals
animals=( ["moo"]="cow" ["woof"]="dog")

declare -A animals=( ["moo"]="cow" ["woof"]="dog")
赋值：animals['key']='value'
展开值："${animals[@]}"
展开key："${!animals[@]}" (notice the !)

2. Bash 3
Bash 4以前，不支持dict功能，也不用使用eval来模拟。

# 函数
1. printf over echo
 echo和printf都是内置命令，echo会在输出的最后添加换行符，并永远返回0，printf可以对字符串格式化输出，一旦失败可以返回非0的状态码。

# Modular Bash?

# 已被废弃的用法

# best practice

Best practices:
http://kvz.io/blog/2013/11/21/bash-best-practices/