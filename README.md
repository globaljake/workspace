# My Workspace
Includes:
- .bash_profile ( [?](http://askubuntu.com/a/29241) )
- atom-package-list.txt ( [?](https://discuss.atom.io/t/installed-packages-list-into-single-file/12227/2) )

### Configurations
#### macOS Terminal
##### - Theme
- [Solorized Dark](http://ethanschoonover.com/solarized)

#### [Atom](https://atom.io/)
##### - Theme
- UI: One Dark
- Syntax: One Dark

##### - Packages Settings
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
