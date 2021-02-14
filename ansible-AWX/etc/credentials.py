DATABASES = {
    'default': {
        'ATOMIC_REQUESTS': True,
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': "awx",
        'USER': "awx",
        'PASSWORD': "awxpass",
        'HOST': "postgres",
        'PORT': "5432",
    }
}

BROADCAST_WEBSOCKET_SECRET = "RjU5a1NVVFlnR3YxSUU6dHEuTktKRG9UMjJqbnBLdkRydURQYlBZV0FMU05Jbjc2ZjVOWWZhTFRQZjlUV2UzZ2ZPVEN6V0x6RFpqYnV1R2wtSllmOGg1WHEyMXd1cXpNNyxRRy5jTlAxRmdDeDU3RWJCMmRXd1JMVVNMSG10Rk8="
