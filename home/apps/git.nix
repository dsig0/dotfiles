{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "dsig0";
        email = "75738471+dsig0@users.noreply.github.com";
      };

      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      line-numbers = true;
      side-by-side = false;
      diff-so-fancy = true;
      navigate = true;
    };
  };

  home.packages = [ pkgs.gh ]; # pkgs.git-lfs

  home.shellAliases = {
    gs = "git status";
    lg = "lazygit";
    ga = "git add";
    gc = "git clone";
    gcm = "git commit -m";
    gaa = "git add --all";
    gb = "git branch";
    gbrd = "git push origin -d";
    gcaam = "git add --all && git commit --amend";
    gcam = "git commit --amend";
    gco = "git checkout";
    gl = "git pull";
    glg = "git log";
    gm = "git merge";
    gp = "git push";
    gpf = "git push --force-with-lease";
    glc = ''git pull origin "$(git rev-parse --abbrev-ref HEAD)"'';
    gpc = ''git push origin "$(git rev-parse --abbrev-ref HEAD)"'';
    gpcf = ''git push origin --force-with-lease "$(git rev-parse --abbrev-ref HEAD)"'';
    gpatch = "git diff --no-ext-diff";
    groot = "cd $(git rev-parse - -show-toplevel)";
    grh = "git reset --hard";
    gri = "git rebase --interactive";
    gst = "git status -s -b && echo && git log | head -n 1";
    gsub = "git submodule update --init --recursive";
    # access github page for the repo we are currently in
    github = "open `git remote -v | grep github.com | grep fetch | head -1 | awk '{print $2}' | sed 's/git:/http:/git'`";
    # cleanup leftover files from merges
    mergeclean = "find . -type f -name '*.orig' -exec rm -f {} ;";
  };
}
