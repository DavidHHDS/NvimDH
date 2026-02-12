# Neovim DH Edition

Configuración personalizada de Neovim sobre Zellij + LSP + Debugger.

---

## Regla de Oro: Separación de Teclas

| Modificador  | Aplicación | Descripción                 |
| ------------ | ---------- | --------------------------- |
| **`Alt`**    | **Zellij** | Multiplexor de terminal     |
| **`Ctrl+w`** | **Neovim** | Ventanas/splits internos    |
| **`Space`**  | **Neovim** | Leader key (menú principal) |

---

## Diccionario de Leader Keys

Al presionar `Space` se muestra el menú de which-key con estos grupos:

| Leader  | Grupo        | Descripción                    |
| ------- | ------------ | ------------------------------ |
| `Space b` | **Buffer**   | Gestión de buffers             |
| `Space c` | **Código**   | Formateo y acciones de código  |
| `Space d` | **Debug**    | Breakpoints, step, REPL        |
| `Space f` | **Buscar**   | Telescope + explorador         |
| `Space g` | **Git**      | LazyGit, hunks, blame          |
| `Space l` | **LSP**      | Definición, referencias, acción|
| `Space u` | **UI/Toggle**| Toggles de interfaz            |
| `Space w` | **Ventana**  | Splits y gestión de ventanas   |
| `Space x` | **Diagnósticos** | Trouble, quickfix          |

---

## Movimientos Esenciales de Vim

### Movimiento por Líneas (con números relativos)

| Comando       | Descripción                  |
| ------------- | ---------------------------- |
| `12j`         | Bajar **12 líneas**          |
| `12k`         | Subir **12 líneas**          |
| `gg`          | Ir al **inicio** del archivo |
| `G`           | Ir al **final** del archivo  |
| `42G` o `:42` | Ir a la **línea 42**         |
| `{`           | Párrafo anterior             |
| `}`           | Párrafo siguiente            |

### Movimiento por Palabras

| Comando | Descripción                           |
| ------- | ------------------------------------- |
| `w`     | Inicio de la **siguiente palabra**    |
| `b`     | Inicio de la **palabra anterior**     |
| `e`     | **Final** de la palabra actual        |
| `W`     | Siguiente PALABRA (ignora puntuación) |
| `B`     | PALABRA anterior                      |

### Movimiento en la Línea

| Comando   | Descripción                         |
| --------- | ----------------------------------- |
| `0`       | **Inicio** de la línea              |
| `^`       | Primer carácter no-espacio          |
| `$`       | **Final** de la línea               |
| `f{char}` | Buscar carácter adelante (ej: `f(`) |
| `F{char}` | Buscar carácter atrás               |
| `t{char}` | Hasta antes del carácter            |
| `;`       | Repetir f/F/t/T                     |

### Movimiento entre Funciones/Código

| Comando | Descripción                                    |
| ------- | ---------------------------------------------- |
| `]]`    | Siguiente **función/clase**                    |
| `[[`    | Función/clase anterior                         |
| `]m`    | Siguiente **método**                           |
| `[m`    | Método anterior                                |
| `%`     | Saltar al paréntesis/llave **correspondiente** |
| `[{`    | Ir al `{` que abre el bloque                   |
| `]}`    | Ir al `}` que cierra el bloque                 |

### Movimiento en Pantalla

| Comando  | Descripción                   |
| -------- | ----------------------------- |
| `Ctrl+d` | **Media página** abajo        |
| `Ctrl+u` | **Media página** arriba       |
| `Ctrl+f` | Página completa abajo         |
| `Ctrl+b` | Página completa arriba        |
| `H`      | Parte **alta** de la pantalla |
| `M`      | **Medio** de la pantalla      |
| `L`      | Parte **baja** de la pantalla |
| `zz`     | **Centrar** línea actual      |
| `zt`     | Línea actual arriba           |
| `zb`     | Línea actual abajo            |

### Búsqueda y Navegación

| Comando  | Descripción                  |
| -------- | ---------------------------- |
| `/texto` | Buscar **adelante**          |
| `?texto` | Buscar **atrás**             |
| `n`      | Siguiente coincidencia       |
| `N`      | Coincidencia anterior        |
| `*`      | Buscar palabra bajo cursor   |
| `#`      | Buscar palabra (hacia atrás) |
| `gd`     | Ir a **definición** (LSP)    |
| `gr`     | Ver **referencias** (LSP)    |

### Marcas (Bookmarks)

| Comando | Descripción                 |
| ------- | --------------------------- |
| `ma`    | Crear marca "a"             |
| `'a`    | Ir a la marca "a"           |
| `''`    | Volver a posición anterior  |
| `` ` `` | Posición exacta de la marca |

---

## Zellij: Atajos con Alt

### Modos Principales

| Atajo     | Modo        | Descripción         |
| --------- | ----------- | ------------------- |
| `Alt + p` | **Pane**    | Gestión de paneles  |
| `Alt + t` | **Tab**     | Gestión de pestañas |
| `Alt + m` | **Move**    | Mover paneles       |
| `Alt + r` | **Resize**  | Redimensionar       |
| `Alt + s` | **Scroll**  | Scroll y búsqueda   |
| `Alt + o` | **Session** | Gestión de sesiones |
| `Alt + q` | **Quit**    | Salir               |

### Session Mode (`Alt + o`) - Gestión de Sesiones

| Tecla | Acción                                                      |
| ----- | ----------------------------------------------------------- |
| `d`   | **Detach** - Salir sin cerrar (sesión sigue en background)  |
| `w`   | Abrir **gestor de sesiones** (cambiar, renombrar, eliminar) |
| `c`   | Abrir **configuración**                                     |
| `p`   | Abrir gestor de **plugins**                                 |
| `Esc` | Volver a modo normal                                        |

**Comandos de terminal para sesiones:**

```bash
zellij list-sessions    # Ver sesiones activas
zellij attach <nombre>  # Reconectar a sesión
zellij kill-session <n> # Eliminar sesión
```

### Navegación Rápida

| Atajo           | Descripción         |
| --------------- | ------------------- |
| `Alt + h/j/k/l` | Mover entre paneles |
| `Alt + n`       | Nuevo panel         |
| `Alt + f`       | Panel flotante      |

---

## Neovim: Atajos Personalizados

### Ventanas y Splits

| Atajo            | Descripción            |
| ---------------- | ---------------------- |
| `Ctrl+w h/j/k/l` | Moverse entre ventanas |
| `Ctrl+w v`       | Split vertical         |
| `Ctrl+w s`       | Split horizontal       |
| `Ctrl+w c`       | Cerrar ventana         |
| `Space -`        | Split horizontal       |
| `Space \|`       | Split vertical         |
| `Space wd`       | Cerrar ventana         |
| `Space wm`       | Maximizar ventana      |

### Explorador (Neo-tree)

Atajos **globales** para abrir/cerrar:

| Atajo      | Descripción                |
| ---------- | -------------------------- |
| `Space e`  | Toggle explorador          |
| `Space E`  | Revelar archivo actual     |
| `Space fe` | Toggle explorador (alias)  |
| `Space fE` | Revelar archivo (alias)    |
| `Space be` | Explorador de buffers      |
| `Space ge` | Explorador de git status   |

Atajos **dentro del explorador** (estilo LazyVim):

| Tecla    | Acción                           |
| -------- | -------------------------------- |
| `l`      | **Abrir** archivo/expandir nodo  |
| `h`      | **Cerrar** nodo/subir a padre    |
| `Enter`  | Abrir archivo                    |
| `o`      | Abrir archivo (alias)            |
| `s`      | Abrir en split horizontal        |
| `v`      | Abrir en split vertical          |
| `t`      | Abrir en nueva pestaña           |
| `P`      | Toggle preview                   |
| `a`      | **Crear** archivo                |
| `A`      | **Crear** directorio             |
| `r`      | **Renombrar**                    |
| `d`      | **Eliminar**                     |
| `c`      | **Copiar** a destino             |
| `m`      | **Mover** a destino              |
| `y`      | Copiar al clipboard (cut/paste)  |
| `x`      | Cortar al clipboard (cut/paste)  |
| `p`      | Pegar desde clipboard            |
| `Y`      | Copiar **ruta** al sistema       |
| `O`      | Abrir con app del **sistema**    |
| `R`      | Refrescar                        |
| `?`      | Mostrar **ayuda**                |
| `<` / `>`| Cambiar fuente (fs/buffers/git)  |
| `q`      | Cerrar explorador                |

### Buffers

| Atajo         | Descripción               |
| ------------- | ------------------------- |
| `Shift + L/H` | Buffer siguiente/anterior |
| `Space bd`    | Cerrar buffer             |
| `Space bD`    | Cerrar todos los buffers  |

### Búsqueda (Telescope)

| Atajo      | Descripción     |
| ---------- | --------------- |
| `Space ff` | Buscar archivos |
| `Space fg` | Buscar texto    |
| `Space fb` | Buscar buffers  |
| `Space fh` | Buscar ayuda    |
| `Space fr` | Recientes       |
| `Space fc` | Comandos        |
| `Space fk` | Atajos          |
| `Space ft` | Buscar TODOs    |

### Clipboard

| Atajo     | Descripción          |
| --------- | -------------------- |
| `y` / `p` | Copiar/pegar interno |
| `Space y` | Copiar al sistema    |
| `Space Y` | Copiar línea al sist.|

### LSP

| Atajo      | Descripción        |
| ---------- | ------------------ |
| `Space ld` | Ir a definición    |
| `Space lD` | Ir a declaración   |
| `Space lr` | Ver referencias    |
| `Space li` | Implementación     |
| `Space lt` | Tipo de definición |
| `Space lh` | Mostrar info       |
| `Space ls` | Firma de función   |
| `Space ln` | Renombrar símbolo  |
| `Space la` | Acciones de código |
| `Space cf` | **Formatear**      |

### Diagnósticos

| Atajo      | Descripción        |
| ---------- | ------------------ |
| `Space dd` | Mostrar diagnóstico|
| `Space dn` | Siguiente diag.    |
| `Space dp` | Diagnóstico anterior|
| `Space dl` | Lista diagnósticos |
| `Space xx` | Trouble toggle     |
| `Space xd` | Trouble buffer     |
| `Space xs` | Trouble símbolos   |

### Git

| Atajo      | Descripción        |
| ---------- | ------------------ |
| `Space gg` | LazyGit            |
| `Space gp` | Preview hunk       |
| `Space gb` | Blame línea        |
| `Space gd` | Diff               |
| `Space gr` | Reset hunk         |
| `Space gs` | Stage hunk         |
| `Space gu` | Unstage hunk       |
| `]h` / `[h`| Siguiente/anterior hunk |

### Debug (DAP)

| Atajo      | Descripción        |
| ---------- | ------------------ |
| `Space db` | Toggle breakpoint  |
| `Space dc` | Continuar          |
| `Space di` | Step into          |
| `Space do` | Step over          |
| `Space dO` | Step out           |
| `Space dr` | REPL               |
| `Space dt` | Terminar           |

### Rodear Texto (Surround)

| Atajo | Descripción                                 |
| ----- | ------------------------------------------- |
| `sa`  | **Añadir** alrededor (Surround Add)         |
| `sd`  | **Borrar** alrededor (Surround Delete)      |
| `sr`  | **Reemplazar** alrededor (Surround Replace) |
| `sf`  | **Buscar** alrededor (Surround Find)        |
| `sh`  | **Resaltar** alrededor (Surround Highlight) |

**Ejemplos de Uso:**

| Acción         | Comando   | Estado Inicial | Estado Final    |
| -------------- | --------- | -------------- | --------------- |
| **Añadir**     | `saw"`    | `hola`         | `"hola"`        |
| **Añadir**     | `saIW(`   | `function`     | `(function)`    |
| **Borrar**     | `sd"`     | `"hola"`       | `hola`          |
| **Reemplazar** | `sr")`    | `"hola"`       | `(hola)`        |
| **Reemplazar** | `sr(<tp>` | `(hola)`       | `<tp>hola</tp>` |

### General

| Atajo     | Descripción          |
| --------- | -------------------- |
| `Space w` | Guardar              |
| `Space W` | Guardar todo         |
| `Space q` | Salir                |
| `Space Q` | Salir sin guardar    |
| `Space L` | Lazy (plugins)       |
| `Space M` | Mason (LSP servers)  |
| `Space ?` | Ver todos los atajos |
| `Esc`     | Limpiar búsqueda     |
