## FUENTES DE VERDAD
https://github.com/folke/lazy.nvim
https://zellij.dev/documentation/configuration.html
https://www.youtube.com/watch?v=C-qvOgIun5U
https://www.youtube.com/watch?v=gL4Z0t0L16o&t=3322s
https://www.lazyvim.org/configuration
https://github.com/mason-org/mason.nvim


## INSTRUCCIONES
1. Revisa las fuentes de verdad, navega en ellas y comprende completamente su logica y contenido.
2. Navega hasta dos niveles de profunidad cada que sea requerido para un mayor contexto.


## CONTEXTO
1. Uso la terminal wezterm con zellij y zsh.

## OBJETIVO
Quiero crear mi poropia configuración de nvim que ya está instalado y que tenga lo siguiente:

1. Explorador de archivos tipo arbol treee.
2. Buscador de archivos tipo finder.
3. Mason para lsp
4. Resaltado de sintaxis.
    - JavaScript
    - TypeScript
    - Python
    - HTML
    - CSS
    - JSON
    - Markdown
    - YAML
    - Lua
    - Rust
    - XML
5. Deben estar configurados los siguientes lsp:
    - JavaScript
    - TypeScript
    - Python
    - Svelte
    - Astro
    - Angular
    - React
    - HTML
    - CSS
    - JSON
    - Markdown
    - YAML
    - Lua
    - Rust
    - XML
6. Deben haber linters y formateadores (Regla: Si ESLint puede formatear y lintar, usar SOLO ESLint)
    - Python (ruff) - Linter y Formatter
    - JavaScript (eslint) - Linter y Formatter
    - TypeScript (eslint) - Linter y Formatter
    - Svelte (eslint) - Linter y Formatter
    - Astro (eslint) - Linter y Formatter
    - Angular (eslint) - Linter y Formatter
    - React (eslint) - Linter y Formatter
    - HTML (prettier)
    - CSS (prettier)
    - JSON (prettier)
    - Markdown (prettier)
    - YAML (prettier)
    - Lua (stylua)
    - Rust (rustfmt)
    - XML (prettier)
7. Debo tener la capacidad de hacer debug en caso de ser necesario.
    - Python (debugpy)
    - JavaScript (node)
    - TypeScript (node)
    - Svelte (node)
    - Astro (node)
    - Angular (node)
    - React (node)
    - HTML (node)
    - CSS (node)
    - JSON (node)
    - Markdown (node)
    - YAML (node)
    - Lua (node)
    - Rust (node)
    - XML (node)
8. Quiero que salgan mis iniciales "DH" en el panel de lazy.
9. Ayuda con los atajos de teclado.
10. Los atajos de teclado no deben ser conflictivos con los de zellij
    - Zellij está configurado para usar Alt como lead key, ver config.kdl

## Reglas.
1. La configuración debe ser en lua.
2. Debe ser estructurada (No estar en un solo archivo).
3. Debe ser funcional.
4. Naming de los archivos debe ser descriptivo.
5. Debe tener comentarios y enlaces a las fuentes de verdad.
6. Para cualquier complemento que vayas a configurar, antes que nada revisa su github y su documentación actual.