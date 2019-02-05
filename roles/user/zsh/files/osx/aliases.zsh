if [[ "$(uname -s)" == "Darwin" ]]; then
    # Shortcuts
    alias d="cd ~/Dropbox"
    alias dl="cd ~/Downloads"
    alias cdw="cd ~/Workspaces"

    # Flush Directory Service cache
    alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

    # Recursively delete `.DS_Store` files
    alias cleanupDSstore="find . -type f -name '*.DS_Store' -ls -delete"

    # Empty the Trash on all mounted volumes and the main HDD
    # Also, clear Apple’s System Logs to improve shell startup speed
    alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"


    # Hide/show all desktop icons (useful when presenting)
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

    # Merge PDF files
    # Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
    alias mergepdf="/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py"

    # Lock the screen (when going AFK)
    alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

fi
