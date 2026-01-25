# Neovim DH Edition

Configuración personalizada de Neovim sobre Zellij + LSP + Debugger.

---

## Regla de Oro: Separación de Teclas

| Modificador | Aplicación | Descripción |
|-------------|------------|-------------|
| **`Alt`** | **Zellij** | Multiplexor de terminal |
| **`Ctrl+w`** | **Neovim** | Ventanas/splits internos |
| **`Space`** | **Neovim** | Leader key (menú principal) |

---

## Movimientos Esenciales de Vim

### Movimiento por Líneas (con números relativos)

| Comando | Descripción |
|---------|-------------|
| `12j` | Bajar **12 líneas** |
| `12k` | Subir **12 líneas** |
| `gg` | Ir al **inicio** del archivo |
| `G` | Ir al **final** del archivo |
| `42G` o `:42` | Ir a la **línea 42** |
| `{` | Párrafo anterior |
| `}` | Párrafo siguiente |

### Movimiento por Palabras

| Comando | Descripción |
|---------|-------------|
| `w` | Inicio de la **siguiente palabra** |
| `b` | Inicio de la **palabra anterior** |
| `e` | **Final** de la palabra actual |
| `W` | Siguiente PALABRA (ignora puntuación) |
| `B` | PALABRA anterior |

### Movimiento en la Línea

| Comando | Descripción |
|---------|-------------|
| `0` | **Inicio** de la línea |
| `^` | Primer carácter no-espacio |
| `$` | **Final** de la línea |
| `f{char}` | Buscar carácter adelante (ej: `f(`) |
| `F{char}` | Buscar carácter atrás |
| `t{char}` | Hasta antes del carácter |
| `;` | Repetir f/F/t/T |

### Movimiento entre Funciones/Código

| Comando | Descripción |
|---------|-------------|
| `]]` | Siguiente **función/clase** |
| `[[` | Función/clase anterior |
| `]m` | Siguiente **método** |
| `[m` | Método anterior |
| `%` | Saltar al paréntesis/llave **correspondiente** |
| `[{` | Ir al `{` que abre el bloque |
| `]}` | Ir al `}` que cierra el bloque |

### Movimiento en Pantalla

| Comando | Descripción |
|---------|-------------|
| `Ctrl+d` | **Media página** abajo |
| `Ctrl+u` | **Media página** arriba |
| `Ctrl+f` | Página completa abajo |
| `Ctrl+b` | Página completa arriba |
| `H` | Parte **alta** de la pantalla |
| `M` | **Medio** de la pantalla |
| `L` | Parte **baja** de la pantalla |
| `zz` | **Centrar** línea actual |
| `zt` | Línea actual arriba |
| `zb` | Línea actual abajo |

### Búsqueda y Navegación

| Comando | Descripción |
|---------|-------------|
| `/texto` | Buscar **adelante** |
| `?texto` | Buscar **atrás** |
| `n` | Siguiente coincidencia |
| `N` | Coincidencia anterior |
| `*` | Buscar palabra bajo cursor |
| `#` | Buscar palabra (hacia atrás) |
| `gd` | Ir a **definición** (LSP) |
| `gr` | Ver **referencias** (LSP) |

### Marcas (Bookmarks)

| Comando | Descripción |
|---------|-------------|
| `ma` | Crear marca "a" |
| `'a` | Ir a la marca "a" |
| `''` | Volver a posición anterior |
| `` ` `` | Posición exacta de la marca |

---

## Zellij: Atajos con Alt

### Modos Principales

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `Alt + p` | **Pane** | Gestión de paneles |
| `Alt + t` | **Tab** | Gestión de pestañas |
| `Alt + m` | **Move** | Mover paneles |
| `Alt + r` | **Resize** | Redimensionar |
| `Alt + s` | **Scroll** | Scroll y búsqueda |
| `Alt + o` | **Session** | Gestión de sesiones |
| `Alt + q` | **Quit** | Salir |

### Session Mode (`Alt + o`) - Gestión de Sesiones

| Tecla | Acción |
|-------|--------|
| `d` | **Detach** - Salir sin cerrar (sesión sigue en background) |
| `w` | Abrir **gestor de sesiones** (cambiar, renombrar, eliminar) |
| `c` | Abrir **configuración** |
| `p` | Abrir gestor de **plugins** |
| `Esc` | Volver a modo normal |

**Comandos de terminal para sesiones:**

```bash
zellij list-sessions    # Ver sesiones activas
zellij attach <nombre>  # Reconectar a sesión
zellij kill-session <n> # Eliminar sesión
```

### Navegación Rápida

| Atajo | Descripción |
|-------|-------------|
| `Alt + h/j/k/l` | Mover entre paneles |
| `Alt + n` | Nuevo panel |
| `Alt + f` | Panel flotante |

---

## Neovim: Atajos Personalizados

### Ventanas (Ctrl+w)

| Atajo | Descripción |
|-------|-------------|
| `Ctrl+w h/j/k/l` | Moverse entre ventanas |
| `Ctrl+w v` | Split vertical |
| `Ctrl+w s` | Split horizontal |
| `Ctrl+w c` | Cerrar ventana |

### Explorador (Neo-tree)

| Atajo | Descripción |
|-------|-------------|
| `Space e` | Toggle explorador |
| `a` / `A` | Crear archivo/carpeta |
| `d` / `r` | Eliminar/renombrar |

### Buffers

| Atajo | Descripción |
|-------|-------------|
| `Shift + L/H` | Buffer siguiente/anterior |
| `Space bd` | Cerrar buffer |

### Búsqueda (Telescope)

| Atajo | Descripción |
|-------|-------------|
| `Space ff` | Buscar archivos |
| `Space fg` | Buscar texto |
| `Space fr` | Recientes |

### Clipboard

| Atajo | Descripción |
|-------|-------------|
| `y` / `p` | Copiar/pegar interno |
| `Space y` | Copiar al sistema |
| `Space p` | Pegar del sistema |

### LSP

| Atajo | Descripción |
|-------|-------------|
| `gd` | Ir a definición |
| `gr` | Ver referencias |
| `K` | Documentación |
| `Space la` | Acciones de código |
| `Space cf` | Formatear |

### Rodear Texto (Surround)

| Atajo | Descripción |
|-------|-------------|
| `sa` | **Añadir** alrededor (Surround Add) |
| `sd` | **Borrar** alrededor (Surround Delete) |
| `sr` | **Reemplazar** alrededor (Surround Replace) |
| `sf` | **Buscar** alrededor (Surround Find) |
| `sh` | **Resaltar** alrededor (Surround Highlight) |

**Ejemplos de Uso:**

| Acción | Comando | Estado Inicial | Estado Final |
|--------|---------|----------------|--------------|
| **Añadir** | `saw"` | `hola` | `"hola"` |
| **Añadir** | `saIW(` | `function` | `(function)` |
| **Borrar** | `sd"` | `"hola"` | `hola` |
| **Reemplazar** | `sr")` | `"hola"` | `(hola)` |
| **Reemplazar** | `sr(<tp>` | `(hola)` | `<tp>hola</tp>` |


### General

| Atajo | Descripción |
|-------|-------------|
| `Space w` | Guardar |
| `Space q` | Salir |
| `Space ?` | Ver todos los atajos |
