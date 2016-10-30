# My Workspace
Includes:
- .bash_profile ( [?](http://askubuntu.com/a/29241) )
- atom-package-list.txt ( [?](https://discuss.atom.io/t/installed-packages-list-into-single-file/12227/2) )

### Configurations
#### Terminal
##### - Theme
- [Solorized Dark](http://ethanschoonover.com/solarized)

#### Atom
##### - Theme
- UI: One Dark
- Syntax: One Dark

##### - Packages Settings
- custom-title
  - Template
  ```js
    <%
      var outerDirectory = projectPath ? projectPath.split('/')[projectPath.split('/').length-2] : '';
      var directory = projectName || '';
      var gitHead = gitHead || '';
      print(outerDirectory + '-' + directory + '[ ' + gitHead + ' ]');
    %>
  ```
