# Frontend :white_square_button:

Esta carpeta contiene archivos necesarios para el *Frontend*. El código relevante se encuentra dentro de la carpeta `src/`.

## Pre-requisitos :memo:

Es necesario contar con:

- *Node.js* y su manejador de paquetes *npm* (que, por defecto, viene incluido en la instalación de *Node.js*).

## Pre-ejecución :nut_and_bolt:

- Instalar los módulos necesarios y sus dependencias mediante el siguiente comando:
```sh
npm install
```

- (Opcional) Levantar el *Backend*.

## Ejecución :outbox_tray:

Ejecutar el siguiente comando:
```sh
npm run dev
```

**Nota**: Ver **Otras formas de ejecutar** más abajo.

## Otras formas de ejecutar :bookmark_tabs:

Para personalizar la configuración del *Frontend*, visitar [este enlace](https://vitejs.dev/config/).

#### Compile and Hot-Reload for Development

```sh
npm run dev
```

#### Compile and Minify for Production

```sh
npm run build
```

#### Run Unit Tests with [Vitest](https://vitest.dev/)

```sh
npm run test:unit
```

#### Run End-to-End Tests with [Cypress](https://www.cypress.io/)

```sh
npm run build
npm run test:e2e # or `npm run test:e2e:ci` for headless testing
```
