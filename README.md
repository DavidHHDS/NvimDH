# Neovim DH Edition

Configuración personalizada de Neovim + Zellij para desarrollo web moderno.

---

## Regla de Oro: Separación de Teclas

| Modificador | Aplicación | Descripción |
|-------------|------------|-------------|
| **`Alt`** | **Zellij** | Multiplexor de terminal |
| **`Ctrl+w`** | **Neovim** | Ventanas/splits internos |
| **`Space`** | **Neovim** | Leader key (menú principal) |

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
| `Alt + o` | **Session** | Sesiones (detach, rename) |
| `Alt + g` | **Lock** | Bloquear Zellij |
| `Alt + q` | **Quit** | Salir de Zellij |

### Navegación Rápida (Sin entrar a modo)

| Atajo | Descripción |
|-------|-------------|
| `Alt + h` | Ir a panel/tab **izquierda** |
| `Alt + j` | Ir a panel **abajo** |
| `Alt + k` | Ir a panel **arriba** |
| `Alt + l` | Ir a panel/tab **derecha** |
| `Alt + n` | **Nuevo panel** |
| `Alt + f` | Toggle **panel flotante** |

### Dentro de Pane Mode (`Alt + p`)

| Tecla | Acción |
|-------|--------|
| `n` | Nuevo panel |
| `r` | Panel a la derecha |
| `d` | Panel abajo |
| `x` | **Cerrar** panel |
| `f` | Fullscreen |
| `w` | Toggle flotante |
| `c` | Renombrar panel |
| `h/j/k/l` | Navegar |

### Dentro de Tab Mode (`Alt + t`)

| Tecla | Acción |
|-------|--------|
| `n` | Nueva pestaña |
| `x` | **Cerrar** pestaña |
| `r` | Renombrar |
| `1-9` | Ir a pestaña N |
| `h/l` | Anterior/siguiente |

### Dentro de Session Mode (`Alt + o`)

| Tecla | Acción |
|-------|--------|
| `d` | **Detach** (salir sin cerrar) |
| `w` | Gestor de sesiones |
| `c` | Configuración |

### Dentro de Scroll Mode (`Alt + s`)

| Tecla | Acción |
|-------|--------|
| `j/k` | Scroll arriba/abajo |
| `d/u` | Media página |
| `/` | Buscar texto |
| `e` | Editar en Neovim |

---

## Neovim: Atajos

### Navegación entre Ventanas (Ctrl+w)

| Atajo | Descripción |
|-------|-------------|
| `Ctrl+w h` | Ventana **izquierda** |
| `Ctrl+w l` | Ventana **derecha** |
| `Ctrl+w j` | Ventana **abajo** |
| `Ctrl+w k` | Ventana **arriba** |
| `Ctrl+w v` | **Split vertical** |
| `Ctrl+w s` | **Split horizontal** |
| `Ctrl+w c` | Cerrar ventana |
| `Ctrl+w o` | Cerrar otras |

> También: `Space wh`, `Space wl`, `Space wv`, etc.

### Explorador (Neo-tree)

| Atajo | Descripción |
|-------|-------------|
| `Space e` | Abrir/cerrar explorador |
| `Space E` | Revelar archivo actual |

**Dentro del explorador:**

| Tecla | Acción |
|-------|--------|
| `a` | **Crear archivo** |
| `A` | **Crear carpeta** |
| `d` | **Eliminar** |
| `r` | **Renombrar** |
| `Enter` | Abrir |
| `v` | Abrir en split vertical |

### Buffers

| Atajo | Descripción |
|-------|-------------|
| `Shift + L` | Buffer siguiente |
| `Shift + H` | Buffer anterior |
| `Space bd` | Cerrar buffer |

### Búsqueda (Telescope)

| Atajo | Descripción |
|-------|-------------|
| `Space ff` | Buscar archivos |
| `Space fg` | Buscar texto |
| `Space fr` | Recientes |
| `Space fb` | Buffers |
| `Space fk` | Atajos |

### Clipboard

| Atajo | Descripción |
|-------|-------------|
| `y` / `p` | Interno de Neovim |
| `Space y` | **Copiar al sistema** |
| `Space p` | **Pegar del sistema** |

### LSP

| Atajo | Descripción |
|-------|-------------|
| `gd` | Ir a definición |
| `gr` | Ver referencias |
| `K` | Documentación |
| `Space la` | Acciones de código |
| `Space ln` | Renombrar |
| `Space cf` | Formatear |

### Git

| Atajo | Descripción |
|-------|-------------|
| `Space gg` | LazyGit |
| `]h` / `[h` | Siguiente/anterior cambio |

### General

| Atajo | Descripción |
|-------|-------------|
| `Space w` | Guardar |
| `Space q` | Salir |
| `Space L` | Lazy (plugins) |
| `Space M` | Mason (LSPs) |
| `Space ?` | Ver todos los atajos |
