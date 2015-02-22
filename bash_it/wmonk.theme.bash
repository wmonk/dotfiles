#!/usr/bin/env bash

SHELL_SSH_CHAR="⌁ "
SHELL_THEME_PROMPT_COLOR=32
SHELL_SSH_THEME_PROMPT_COLOR=208

VIRTUALENV_CHAR="ⓔ "
VIRTUALENV_THEME_PROMPT_COLOR=21

SCM_NONE_CHAR=""
SCM_GIT_CHAR="⎇  "
SCM_GIT_BEHIND_CHAR="↓"
SCM_GIT_AHEAD_CHAR="↑"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_DIRTY=""
SCM_THEME_PROMPT_COLOR=238
SCM_THEME_PROMPT_CLEAN_COLOR=220
SCM_THEME_PROMPT_DIRTY_COLOR=400

CWD_THEME_PROMPT_COLOR=240

LAST_STATUS_THEME_PROMPT_COLOR=52

function set_rgb_color {
    if [[ "${1}" != "-" ]]; then
        fg="38;5;${1}"
    fi
    if [[ "${2}" != "-" ]]; then
        bg="48;5;${2}"
        [[ -n "${fg}" ]] && bg=";${bg}"
    fi
    echo -e "\[\033[${fg}${bg}m\]"
}

function powerline_shell_prompt {
    if [[ -n "${SSH_CLIENT}" ]]; then
        SHELL_PROMPT="${bold_white}$(set_rgb_color - ${SHELL_SSH_THEME_PROMPT_COLOR}) ${SHELL_SSH_CHAR}\u@\h ${normal}"
    else
        SHELL_PROMPT="$(color cyan)mothership: ${normal}"
    fi
}

function powerline_virtualenv_prompt {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        virtualenv=$(basename "$VIRTUAL_ENV")
        VIRTUALENV_PROMPT="$(set_rgb_color ${VIRTUALENV_THEME_PROMPT_COLOR} -) ${VIRTUALENV_CHAR}$virtualenv ${normal}"
    else
        VIRTUALENV_PROMPT=""
    fi
}

function powerline_scm_prompt {
    scm_prompt_vars

    if [[ "${SCM_NONE_CHAR}" != "${SCM_CHAR}" ]]; then
        if [[ "${SCM_DIRTY}" -eq 1 ]]; then
            SCM_PROMPT="$(color red fg bright)"
        else
            SCM_PROMPT="$(color reset green)"
        fi
        # $(set_rgb_color - ${LAST_STATUS_THEME_PROMPT_COLOR}) ${LAST_STATUS} ${normal}$(set_rgb_color ${LAST_STATUS_THEME_PROMPT_COLOR} -)${THEME_PROMPT_SEPARATOR}${normal}
        [[ "${SCM_GIT_CHAR}" == "${SCM_CHAR}" ]] && SCM_PROMPT+="[git:${SCM_BRANCH}${SCM_STATE}${SCM_GIT_BEHIND}${SCM_GIT_AHEAD}]"
        SCM_PROMPT="${SCM_PROMPT} ${normal}"
    else
        SCM_PROMPT=""
    fi
}

function powerline_cwd_prompt {
    CWD_PROMPT="$(color yellow)\w "
}

function powerline_prompt_command() {
    local LAST_STATUS="$?"

    powerline_shell_prompt
    powerline_scm_prompt
    powerline_cwd_prompt

    PS1="\n${SHELL_PROMPT}${CWD_PROMPT}${SCM_PROMPT}\n${normal}→ "
}

PROMPT_COMMAND=powerline_prompt_command

