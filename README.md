# fish-npm-scripts-completion

npm + TAB => list of commands available for npm  
npm run + TAB => list of scripts from package.json

# Installation

Be sure to have `~/.config/fish/completions` folder and then run:
`test -f ~/.config/fish/completions/npm.fish;or curl https://raw.githubusercontent.com/sudodoki/fish-npm-scripts-completion/master/npm.fish ~/.config/fish/completions/npm.fish`

or just download [npm.fish](https://raw.githubusercontent.com/sudodoki/fish-npm-scripts-completion/master/npm.fish) and put it into `~/.config/fish/completions` or any other folder in `$fish_complete_path` variable

Restart your fish and it should run.

# Fish versions supported

Confirmed this is working with fish v2.2.0 (you can get version of fish by running `fish -v`). Had issues with prior version and `complete -e` of arguments (if you want to make it work with fish < 2.2.0 I assume you will need to modify `fish_complete` and `complete -e` each word in string)