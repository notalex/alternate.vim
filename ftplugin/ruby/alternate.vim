let rails_gem_string = system('[ -s Gemfile ] && ' .
                            \ '[ -n "$(cat Gemfile | grep gem.\''rails\'')" ] &&' .
                            \ 'echo 1')

if strlen(rails_gem_string) | finish | endif

command! A call alternate#SwitchToFile()
