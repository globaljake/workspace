# My Workspace
Includes:
- .bash_profile ( [?](http://askubuntu.com/a/29241) )
- atom-package-list.txt ( [?](https://discuss.atom.io/t/installed-packages-list-into-single-file/12227/2) )

### Install & Configure
#### macOS Terminal
###### - Install
- [Homebrew](http://brew.sh/)
- Git (Should already be installed)
- [Node / NPM](https://changelog.com/posts/install-node-js-with-homebrew-on-os-x)
- [bash-completion](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)
- [git-completion](http://code-worrier.com/blog/autocomplete-git/)
- [.bash_profile](https://github.com/globaljake/workspace/blob/master/.bash_profile) (Copy into home directory. ~/.bash_profile)

###### - Theme
- [Solorized Dark](http://ethanschoonover.com/solarized)

#### [Atom](https://atom.io/)
###### - Install
- Packages from [atom-package-list.txt](https://github.com/globaljake/workspace/blob/master/atom-package-list.txt) via "atom-install-package-list" function in [.bash_profile](https://github.com/globaljake/workspace/blob/master/.bash_profile)

###### - Theme
- UI: One Dark
- Syntax: One Dark

###### - Packages Settings
- [custom-title](https://atom.io/packages/custom-title)
  - Template
  ```js
    <%
      var limitedProjectPath = projectPath ? projectPath.split('/').slice(-2).join('/') : '';
      var gitBranch = gitHead ? '[' + gitHead + ']' : '';
      // ex. [master] projects/myProject
      print(gitBranch + ' ' + limitedProjectPath);
    %>
  ```
