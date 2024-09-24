{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      shut = "shutdown -h now";
      ls = "exa --icons $argv";
      la = "exa --icons -al";
      ll = "exa --icons -l";
    };

    functions = {
      fish_greeting = {
        body = ''
          echo " "
          hyprctl splash;
          echo " "
        '';
      };

      fish_prompt = {
        body = ''
          set -l __last_command_exit_status $status
          set -l cyan (set_color -o cyan)
          set -l yellow (set_color -o yellow)
          set -l red (set_color -o red)
          set -l green (set_color -o green)
          set -l blue (set_color -o blue)
          set -l normal (set_color normal)

          set -l arrow_color "$green"
          if test $__last_command_exit_status != 0
              set arrow_color "$red"
          end

          set -l arrow "$arrow_color "
          if fish_is_root_user
              set arrow "$arrow_color# "
          end

          set -l cwd $cyan(basename (prompt_pwd))

          set -l repo_info
          if set -l repo_type (_repo_type)
              set -l repo_branch $red(_repo_branch_name $repo_type)
              set repo_info "$blue $repo_type:($repo_branch$blue)"

              if _is_repo_dirty $repo_type
                  set -l dirty "$yellow ✗"
                  set repo_info "$repo_info$dirty"
              end
          end

          echo -n -s $arrow ' '$cwd $repo_info $normal ' '
        '';
      };

      _git_branch_name = {
        body = ''
          set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
          if set -q branch[1]
              echo (string replace -r '^refs/heads/' ''' $branch)
          else
              echo (git rev-parse --short HEAD 2>/dev/null)
          end
        '';
      };

      _is_git_dirty = {
        body = ''
          not command git diff-index --cached --quiet HEAD -- &>/dev/null
          or not command git diff --no-ext-diff --quiet --exit-code &>/dev/null
        '';
      };

      _is_git_repo = {
        body = ''
          type -q git
          or return 1
          git rev-parse --git-dir >/dev/null 2>&1
        '';
      };

      _hg_branch_name = {
        body = ''
          echo (hg branch 2>/dev/null)
        '';
      };

      _is_hg_dirty = {
        body = ''
          set -l stat (hg status -mard 2>/dev/null)
          test -n "$stat"
        '';
      };

      _is_hg_repo = {
        body = ''
          fish_print_hg_root >/dev/null
        '';
      };

        _repo_branch_name = {
          body = ''
            _$argv[1]_branch_name
          '';
        };

        _is_repo_dirty = {
          body = ''
            _is_$argv[1]_dirty
          '';
        };

        _repo_type = {
          body = ''
            if _is_hg_repo
                echo hg
                return 0
            else if _is_git_repo
                echo git
                return 0
            end
            return 1
          '';
        };
    };
  };
}
