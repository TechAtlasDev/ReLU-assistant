import pickle, os, json, notify2, platform, psutil

RUTA_ARCHIVO = "/".join(os.path.abspath(__file__).split("/")[:-1])

def get_dataOS():
    data = {
        "system": platform.system(),
        "release": platform.release(),
        "version": platform.version(),
        "architecture": platform.architecture(),
        "machine": platform.machine(),
        "processor": platform.processor(),
        "cpu_count": psutil.cpu_count(logical=False),
        "cpu_threads": psutil.cpu_count(logical=True),
        "ram_total": round(psutil.virtual_memory().total / (1024 ** 3), 2),
        "ram_available": round(psutil.virtual_memory().available / (1024 ** 3), 2),
        "disk_total": round(psutil.disk_usage('/').total / (1024 ** 3), 2),
        "disk_free": round(psutil.disk_usage('/').free / (1024 ** 3), 2),
        "name_user": load_json()["name"]
    }
    return data

def notifyc(title, body, status):
    ICON_ERROR = f"{RUTA_ARCHIVO}/icons/error.png"
    ICON_CHECK = f"{RUTA_ARCHIVO}/icons/check.png"
    list_icons = [ICON_CHECK, ICON_ERROR]
    try:
        notify2.init(app_name="ReLU")
        notif = notify2.Notification(title, body, icon=ICON_CHECK if status else ICON_ERROR)
        notif.show()
        return True
    except:
        return False    

def load_json(file="config.json"):
    try:
        ruta = f"{RUTA_ARCHIVO}/{file}"
        file = open(ruta, "r").read()
        file = json.loads(file)
        return file
    except:
        return None

def save_json(data, file="config.json"):
    try:
        ruta = f"{RUTA_ARCHIVO}/{file}"
        with open(ruta, "w") as f:
            json.dump(data, f, indent=4)
        return True
    except Exception as e:
        print(f"Error saving JSON: {e}")
        return False
    
def load_chat(ruta=f"{RUTA_ARCHIVO}/conversation.pkl"):
    try:
        with open(ruta, "rb") as f:
            arx = pickle.load(f)
        return arx
    except:
        return None

def save_chat(chat, arx=f"{RUTA_ARCHIVO}/conversation.pkl"):
    with open(arx, "wb") as f:
        pickle.dump(chat, f)

GL = "\033[96;1m" # Azul agua
BB = "\033[34;1m" # Azul claro
YY = "\033[33;1m" # Amarillo claro
GG = "\033[32;1m" # Verde claro
WW = "\033[0;1m"  # Blanco claro
RR = "\033[31;1m" # Rojo claro
CC = "\033[36;1m" # Cyan claro
B = "\033[34m"    # Azul
Y = "\033[33;1m"  # Amarillo
G = "\033[32m"    # Verde
W = "\033[0;1m"   # Blanco
R = "\033[31m"    # Rojo
C = "\033[36;1m"  # Cyan
M = "\033[35;1m"  # Morado
FONDO_NEGRO = "\033[33;40m"
FONDO_NEUTRO = "\033[0m"

NOTIFICATION = YY+"["+GG+"+"+YY+"]"+WW+" {}"
ERROR_NOT = YY+"["+RR+"+"+YY+"]"+WW+" {}"
USER = YY+"|"+BB+load_json()["name"]+YY+":"+WW+" {}"
MODEL = YY+"|"+GG+"ReLU "+YY+":"+WW+" {}"