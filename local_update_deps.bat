time /t

set CONF=%1
set DEPS_DIR=.\conan_conf\

if not defined CONF (
    goto default_conf
) else (
    echo "You use configuration %CONF%."
    goto configure
)

:default_conf
SET CONF=Debug
echo "You use default configuration %CONF%. You can use argument Debug or Released."

:configure

rem goto end

rem pip install --upgrade pip
python -m venv tmpEnv

CALL ".\tmpEnv\Scripts\activate"

pip install conan==2.10.1

conan install %DEPS_DIR% -s build_type=%CONF% -of=conan/%CONF% --build=missing --profile %DEPS_DIR%%CONF%_prf

CALL ".\tmpEnv\Scripts\deactivate"

:end

time /t
