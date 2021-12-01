if [ -d ~/Library/Group\ Containers/*.com.seriflabs ] ; then
    echo "Deleting Group Containers ..."
    rm -rf ~/Library/Group\ Containers/*.com.seriflabs
fi

if [ -f /Library/Logs/DiagnosticReports/Affinity* ] ; then
    echo "Deleting Logs ..."
    rm /Library/Logs/DiagnosticReports/Affinity*
fi

