# Emacsキーバインド
bindkey -e

## PROMPT ##
# PROMPTで変数参照
setopt prompt_subst
prompt_custom() {
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    local git_branch="$(__git_ps1 "\033[36m[%s]\033[0m")"

    case ${UID} in
        0)
            PROMPT="%B%{[31m%}%~%{[m%}%b $git_branch
$ "
            PROMPT2="%B%{[31m%}%_%{[m%}%b> "
            SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
            ;;
        *)
            PROMPT="%{[34m%}%n@%m%{[m%}:%{[33m%}%~%{[m%} $git_branch
$ "
            PROMPT2="%{[34m%}%_%{[m%}> "
            # RPROMPT="[%{[33m%}%*%{[m%}]"
            SPROMPT="%{[34m%}%r is correct? [n,y,a,e]:%{[m%} "
            ;;
    esac
}

source ~/.zsh/prompt/git-prompt.sh

precmd() {
  prompt_custom
}

# プロンプトのカラー表示を有効
autoload -U colors
colors

########

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## 補完 ##
# デフォルトの補完機能
autoload -U compinit
compinit

# 補完候補を詰めて表示
setopt list_packed

# 補完候補表示時にbeepを鳴らさない
setopt nolistbeep

# cd でpushd
setopt auto_pushd

# pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

# globを拡張する。
setopt extended_glob

# ディレクトリ名だけで移動できる。
setopt auto_cd

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 履歴の共有
setopt share_history

# 履歴ファイルに時刻を記録
setopt extended_history

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

alias ll="ls -l"
alias po="popd"

# 環境依存はzshrc.localを読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
