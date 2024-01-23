sudo apt install ufw
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 8888
sudo ufw status

pip install -U jupyter
jupyter notebook --generate-config

if test -e /home/pi/.jupyter/jupyter_notebook_config.py; then
  echo "c.NotebookApp.ip = '0.0.0.0'  # listen on all IPs" >> /home/pi/.jupyter/jupyter_notebook_config.py
  echo "c.NotebookApp.token = ''  # disable authentication" >> /home/pi/.jupyter/jupyter_notebook_config.py
  echo "c.NotebookApp.allow_origin = '*'  # allow access from anywhere" >> /home/pi/.jupyter/jupyter_notebook_config.py
  echo "c.NotebookApp.disable_check_xsrf = True # allow cross-site requests" >> /home/pi/.jupyter/jupyter_notebook_config.py

  jupyter notebook
else
  echo "File di configurazione di jupyter non trovato"
fi

