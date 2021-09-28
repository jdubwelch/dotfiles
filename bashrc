## To switch environment to scrum.
function switchScrum {
    # Switch environment.
    sudo sed -i -e '/^DEVTYPE/s/develop/scrum/' /etc/environment

    # Update envvars.
    sudo sed -i -e '/^export DEVTYPE/s/develop/scrum/' /etc/apache2/envvars

    # Update the different apache config files.
    sudo sed -i -e '/^[:space: tab]*ServerName api/s/dev/scrum/' /etc/apache2/sites-available/api.conf
    sudo sed -i -e '/^[:space: tab]*ServerName api/s/dev/scrum/' /etc/apache2/sites-available/api-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName fbapp/s/dev/scrum/' /etc/apache2/sites-available/fbapp.conf
    sudo sed -i -e '/^[:space: tab]*ServerName fbapp/s/dev/scrum/' /etc/apache2/sites-available/fbapp-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName signup/s/dev/scrum/' /etc/apache2/sites-available/signup.conf
    sudo sed -i -e '/^[:space: tab]*ServerName signup/s/dev/scrum/' /etc/apache2/sites-available/signup-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName stats/s/dev/scrum/' /etc/apache2/sites-available/stats.conf
    sudo sed -i -e '/^[:space: tab]*ServerName stats/s/dev/scrum/' /etc/apache2/sites-available/stats-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName staticos/s/dev/scrum/' /etc/apache2/sites-available/staticos.conf
    sudo sed -i -e '/^[:space: tab]*ServerName staticos/s/dev/scrum/' /etc/apache2/sites-available/staticos-ssl.conf

    # If the .bashrc doesn't have the DEVTYPE exported in it, then append it to the end of the file.
    if grep -q "^export DEVTYPE=" ~/.bashrc; then
        sed -i -e '/^export DEVTYPE/s/develop/scrum/' ~/.bashrc
    else
        sed -i '$ a\export DEVTYPE=scrum' ~/.bashrc
    fi

    # Reload the bashrc file and restart apache.
    source ~/.bashrc
    sudo service apache2 restart
}

## To switch environment to develop.
function switchDevelop {
    # Switch environment.
    sudo sed -i -e '/^DEVTYPE/s/scrum/develop/' /etc/environment

    # Update envvars.
    sudo sed -i -e '/^export DEVTYPE/s/scrum/develop/' /etc/apache2/envvars

    # Update the different apache config files.
    sudo sed -i -e '/^[:space: tab]*ServerName api/s/scrum/dev/' /etc/apache2/sites-available/api.conf
    sudo sed -i -e '/^[:space: tab]*ServerName api/s/scrum/dev/' /etc/apache2/sites-available/api-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName fbapp/s/scrum/dev/' /etc/apache2/sites-available/fbapp.conf
    sudo sed -i -e '/^[:space: tab]*ServerName fbapp/s/scrum/dev/' /etc/apache2/sites-available/fbapp-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName signup/s/scrum/dev/' /etc/apache2/sites-available/signup.conf
    sudo sed -i -e '/^[:space: tab]*ServerName signup/s/scrum/dev/' /etc/apache2/sites-available/signup-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName stats/s/scrum/dev/' /etc/apache2/sites-available/stats.conf
    sudo sed -i -e '/^[:space: tab]*ServerName stats/s/scrum/dev/' /etc/apache2/sites-available/stats-ssl.conf
    sudo sed -i -e '/^[:space: tab]*ServerName staticos/s/scrum/dev/' /etc/apache2/sites-available/staticos.conf
    sudo sed -i -e '/^[:space: tab]*ServerName staticos/s/scrum/dev/' /etc/apache2/sites-available/staticos-ssl.conf

    # If the .bashrc doesn't have the DEVTYPE exported in it, then append it to the end of the file.
    if grep -q "^export DEVTYPE=" ~/.bashrc; then
        sed -i -e '/^export DEVTYPE/s/scrum/develop/' ~/.bashrc
    else
        sed -i '$ a\export DEVTYPE=develop' ~/.bashrc
    fi

    # Reload the bashrc file and restart apache.
    source ~/.bashrc
    sudo service apache2 restart
}

PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '

