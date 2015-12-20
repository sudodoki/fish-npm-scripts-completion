# if this is npm … return 0 else 1
function __fish_npm_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'npm' ]
    return 0
  end
  return 1
end

# if this is npm followed by $argv[1] then return 0
function __fish_npm_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_npm_scripts 
  # 1) npm run returns list of scripts defiend in package.json as of https://github.com/npm/npm/issues/4888
  # 2) grep those indented by 2 spaces (there are headers w/ no identation & nested w/ bigger identation)
  # 3) remove leading whitespace
  # 4) pass to xargs to concatenate into single string
  echo (npm run 2>/dev/null | grep '^\s\s\S' | sed -e 's/^[[:blank:]]*//' | xargs)
end

set completions ''
# Is ran whenever $PWD is changed
function fish_complete --on-variable PWD
    # erase previous completions (had issues with Fish version prior to 2.2.0 caching values here)
    if set -q completions; complete -c npm -n '__fish_npm_using_command run' -e -a "$completions"; end
    # taken from empty npm && 'where <command> is one of:…'
    complete -f -c npm -n '__fish_npm_needs_command' -a "access add-user adduser apihelp author bin bugs c cache completion config ddp dedupe deprecate dist-tag dist-tags docs edit explore faq find find-dupes get help help-search home i info init install issues la link list ll ln login logout ls outdated owner pack ping prefix prune publish r rb rebuild remove repo restart rm root run run-script s se search set show shrinkwrap star stars start stop t tag team test tst un uninstall unlink unpublish unstar up update upgrade v verison version view whoami"
    set completions (__fish_npm_scripts)
    # add completions for run command
    complete -c npm -n '__fish_npm_using_command run' -f  -a "$completions"
end

fish_complete