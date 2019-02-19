alias ls='ls --color'
alias grep='grep --color'
alias ...='cd ../..'
alias ....='cd ../../..'
alias agu='apt-get update'
alias agi='apt-get install'
alias agg='apt-get upgrade'
alias agd='apt-get dist-upgrade'
alias acs='apt-cache search'

alias bb='bitbake -f -c compile'
alias bbc='bitbake axis-image-cvp'
alias bbb='bitbake axis-image-cvp && dd if=fimage bs=$((0x00100000)) skip=0 count=1 of=bootloader.bin'
alias bbp='bitbake axis-image-production'
alias bbr='bitbake -g axis-image-cvp && cat pn-depends.dot | grep -v -e "-native" | grep -v digraph | grep -v -e "-image" | awk '\''{print $1}'\'' | sort | uniq'
alias blr='bitbake-layers show-recipes | grep'
alias ds='devtool search'
alias bbmp='bitbake modambarella-s3l -c print_checksums | grep MD5SUM | awk '\''{ print $3 $4 $5 }'\'''
alias bbs='bitbake axis-image-svp-test'
alias gpr="git push-review"
alias gpd="git push-draft-review"
alias b='ssh 192.168.77.52'
# https://github.com/sharkdp/bat
alias cat='bat -n'
alias chkernel='git format-patch -1 HEAD  --stdout | ./scripts/checkpatch.pl - --max-line-length=100 --min-conf-desc-length=1 --ignore GERRIT_CHANGE_ID --ignore MISSING_SIGN_OFF --ignore FILE_PATH_CHANGES  --ignore COMMIT_LOG_LONG_LINE'

function kerch() {
    git format-patch -1 HEAD --stdout | $1/linux-2.6/scripts/checkpatch.pl - --ignore GERRIT_CHANGE_ID --ignore MISSING_SIGN_OFF --ignore FILE_PATH_CHANGES --ignore GIT_COMMIT_ID --ignore COMMIT_LOG_LONG_LINE --max-line-length=100 --min-conf-desc-length=1
}

function amdolphin() {
    ssh pigswine binary-build s3l user/chenhuiz/test IR2.5.14-1 special/pmt-7.30 R12.8.19
}

function odolphin() {
    oe-setup -w $1 -m projects/dolphin.xml -b rel/fw-7.30/maint
}

function opdolphin() {
    oe-setup -w $1 -m projects/dolphin.xml -b rel/fw-7.30/maint --groups=default,meta-production
}

function opluto() {
    oe-setup -w $1 -m projects/pluto.xml -b rel/fw-7.10/maint
}

function oppluto() {
    oe-setup -w $1 -m projects/pluto.xml -b rel/fw-7.10/maint --groups=default,meta-production
}

function de() {
    devtool extract $1 sources/$1
}

function dm() {
    devtool modify -x $1 sources/$1
}

function dmake() {
	endpath=$(basename $(pwd))
	devtool build $(basename $(pwd))
}

function dur() {
    devtool update-recipe $1 -a ../../$2
}

function db() {
    devtool build $1
}

function dt() {
    devtool deploy-target --no-check-space $1 root@192.168.77.$2 -c
}

#export VIRTUAL_ENV_DISABLE_PROMPT=y
#source /home/chenhuiz/virtual_envs/prod-python-2.7.3/bin/activate
#alias pip='http_proxy=http://wwwproxy:3128 https_proxy=http://wwwproxy:3128 pip'

source ~/.git-completion.bash

source ~/work/fix/oe-setup/oe-setup.sh > /dev/null 2>&1

export HISTSIZE=4000
export HISTIGNORE="&"
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/go/bin:/home/linuxbrew/.linuxbrew/bin

#export AXIS_DIST_HOST=shcndev-dist.sh.cn.axis.com
export AXIS_DIST_HOST=dev-dist.se.axis.com
export CVS_RSH=ssh

export https_proxy="http://wwwproxy.se.axis.com:3128"
export http_proxy="http://proxycluster.se.axis.com:3128"
#export http_proxy="http://wwwproxy.hk.axis.com:3128"
#export https_proxy="http://wwwproxy.hk.axis.com:3128"
unset all_proxy
unset ALL_PROXY

#export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

PS1='${debian_chroot:+($debian_chroot)}\[\e[0;39m\]\u@\h\[\e[m\]:\[\e[0;36m\]\w\[\e[m\]\$ '


#. /home/chenhuiz/win10/图像风格迁移/distro/install/bin/torch-activate

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/chenhuiz/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/chenhuiz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chenhuiz/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/chenhuiz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

#export MCFLY_LIGHT=TRUE
if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
	. $(brew --prefix)/opt/mcfly/mcfly.bash
fi
