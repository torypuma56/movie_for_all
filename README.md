# Movie 4 All

**Aplicación:** Movie 4 All  
**Desarrollador:** RENE TURIHUANO PUMA  
**Plataforma:** Flutter / Dart  
**Versión:** `0.1.0+1`  
**Paquete:** `movies_4_all`

---

## Descripción

Movie 4 All es una aplicación Flutter para explorar películas y series de The Movie Database (TMDB).  
Muestra catálogos de estrenos, películas mejor valoradas, tendencias y series populares, y permite abrir pantallas de detalle con información completa: metadatos, géneros, productoras, plataformas, temporadas y elenco.

La app usa un tema oscuro tipo cine, navegación declarativa con `go_router` y manejo de estado con Riverpod.

---

## Funcionalidades

### Inicio

- Carruseles de películas en cartelera, mejor valoradas y en tendencia.
- Carruseles de series populares, en emisión y mejor valoradas.
- Navegación al detalle de películas y series desde las tarjetas.
- Encabezado con el nombre de la aplicación.

### Detalles de películas

Ruta: `/movie-details/:id`

- Imagen principal con `backdrop_path` o `poster_path`.
- Título, tagline y sinopsis.
- Calificación, año, duración/estado y países de origen.
- Géneros.
- Productoras.
- Elenco filtrado: `known_for_department == Acting`, con foto, ordenado por `order`, máximo 10 actores.

### Detalles de series

Ruta: `/series-details/:id`

- Imagen principal con `backdrop_path` o `poster_path`.
- Nombre, tagline y sinopsis.
- Calificación, año, estado, temporadas y episodios.
- Géneros.
- Plataformas / cadenas de emisión.
- Creadores.
- Temporadas con número de episodios.
- Elenco filtrado con el mismo criterio que películas.

### Otras pantallas

- `/series`: listado de series.
- `/trending-movies`: películas en tendencia.

---

## Stack técnico

| Dependencia                                  | Uso                             |
| -------------------------------------------- | ------------------------------- |
| `flutter`                                    | UI multiplataforma              |
| `dio`                                        | Cliente HTTP para TMDB          |
| `flutter_riverpod`                           | Manejo de estado y providers    |
| `go_router`                                  | Navegación declarativa          |
| `flutter_dotenv`                             | Carga de variables de entorno   |
| `sizer`                                      | Escalado responsivo             |
| `google_fonts`                               | Tipografía Plus Jakarta Sans    |
| `font_awesome_flutter`                       | Iconografía adicional           |
| `slang` / `slang_flutter`                    | Soporte de internacionalización |
| `riverpod_annotation` / `riverpod_generator` | Generación de providers         |

SDK requerido: `^3.13.4`.

---

## Estructura del proyecto

```text
movies_4_all/
├── assets/                         # Recursos estáticos
├── lib/
│   ├── main.dart                   # Entry point, ProviderScope, Sizer, MaterialApp.router
│   ├── core/
│   │   ├── config/                 # Configuración general
│   │   ├── data/
│   │   │   └── data_sources/
│   │   │       └── end_points.dart # Endpoints de TMDB
│   │   ├── dio_options/
│   │   │   └── dio_conector.dart   # Dio + bearer token + timeouts + interceptors
│   │   ├── provider/               # Providers compartidos
│   │   ├── routes/
│   │   │   └── app_routes.dart     # Rutas y helpers de navegación
│   │   ├── theme/                  # Colores, tipografía, spacing, radius, ThemeData
│   │   └── widgets/
│   │       └── info_chip.dart      # Chip responsive reutilizable
│   └── features/
│       ├── home/                   # Pantalla principal y tarjetas
│       ├── movie_details/          # Detalle de película y elenco
│       ├── series_details/         # Detalle de serie y elenco
│       ├── play_now_movies/        # Películas en cartelera
│       ├── top_rated_movies/       # Películas mejor valoradas
│       ├── trending_movies/        # Películas en tendencia
│       └── series/                 # Series populares / en emisión / top rated
├── test/
│   ├── features/                   # Tests de modelos
│   └── theme/                      # Tests del tema
├── pubspec.yaml
└── README.md
```

Cada feature sigue una arquitectura por capas:

```text
feature/
├── data/
│   ├── models/       # Modelos fromJson / toJson / toEntity
│   └── repo_impl/    # Implementación del repositorio + provider de Riverpod
├── domain/
│   ├── entities/     # Entidades inmutables del dominio
│   └── repository/   # Contratos abstractos
└── presentation/
    ├── pages/        # Pantallas
    ├── providers/    # States y AsyncNotifiers
    └── widgets/      # Widgets específicos del feature
```

---

## Rutas

Definidas en `lib/core/routes/app_routes.dart`:

| Ruta                  | Pantalla             |
| --------------------- | -------------------- |
| `/`                   | `HomePage`           |
| `/movie-details/:id`  | `MovieDetailsPage`   |
| `/series-details/:id` | `SeriesDetailsPage`  |
| `/series`             | `SeriesPage`         |
| `/trending-movies`    | `TrendingMoviesPage` |

Helpers disponibles:

```dart
AppRoutes.movieDetailsPath(550)
AppRoutes.seriesDetailsPath(1399)
```

---

## Endpoints usados

Definidos en `lib/core/data/data_sources/end_points.dart`:

| Endpoint                        | Uso                       |
| ------------------------------- | ------------------------- |
| `/movie/now_playing`            | Películas en cartelera    |
| `/movie/top_rated`              | Películas mejor valoradas |
| `/trending/movie/{time_window}` | Películas en tendencia    |
| `/tv/popular`                   | Series populares          |
| `/tv/on_the_air`                | Series en emisión         |
| `/tv/top_rated`                 | Series mejor valoradas    |
| `/movie/{id}`                   | Detalle de película       |
| `/movie/{id}/credits`           | Elenco de película        |
| `/tv/{id}`                      | Detalle de serie          |
| `/tv/{id}/credits`              | Elenco de serie           |

---

## Configuración

### 1. Obtener el token de TMDB

1. Crea una cuenta en [The Movie Database](https://www.themoviedb.org/).
2. Entra en `Settings > API`.
3. Solicita acceso de desarrollador.
4. Copia el valor de **API Read Access Token**.

### 2. Crear el archivo `.env`

Crea un archivo `.env` en la raíz del proyecto:

```env
API_KEY=tu_read_access_token_aquí

TMDB_BASE_PATH=https://api.themoviedb.org/3
TMDB_LANGUAGE=es-ES

TMDB_IMG_URL=https://image.tmdb.org/t/p/original
TMDB_IMG_URL_W500=https://image.tmdb.org/t/p/w500
```

`API_KEY` se envía como header `Authorization: Bearer <token>` desde `DioConnector`.

Actualmente la app lee la configuración desde `.env` mediante `flutter_dotenv`; no consume `--dart-define` directamente.

### 3. Instalar dependencias

```powershell
flutter pub get
```

### 4. Ejecutar

```powershell
flutter run
```

---

## Seguridad

- `.env` debe permanecer en `.gitignore`.
- No subas el token al repositorio.
- El archivo `.env` se empaqueta como asset de la app y podría extraerse de un APK publicado.
- Para producción, usa un backend intermedio o un pipeline que inyecte credenciales de forma segura.

---

## Paleta de colores

La paleta se deriva de la semilla **`#491E29`** y mantiene el fondo obsidiana original.

| Token                             | Hex                     | Uso                                                     |
| --------------------------------- | ----------------------- | ------------------------------------------------------- |
| `electricUltraviolet` / `primary` | `#F2B8C6`               | Acciones principales, botones, sliders, selected states |
| `onPrimary`                       | `#491E29`               | Texto/iconos sobre primary                              |
| `primaryContainer`                | `#6E2F3F`               | Contenedores primary                                    |
| `onPrimaryContainer`              | `#FFD9E2`               | Contenido sobre primaryContainer                        |
| `brightHeliotrope` / `secondary`  | `#E8A8B8`               | Glow ambiental, gradientes, secondary                   |
| `vividEmeraldLime` / `tertiary`   | `#F3C969`               | Calificaciones, scores, badges dorados                  |
| `baseObsidian`                    | `#09060E`               | Fondo del Scaffold y canvas                             |
| `surface`                         | `#16121B`               | Superficies Material 3                                  |
| `surfaceContainerLow`             | `#1E1A23`               | Cards y chips                                           |
| `surfaceBorder`                   | `rgba(242,184,198,0.4)` | Bordes luminosos rose                                   |

Los nombres históricos de los tokens (`electricUltraviolet`, `vividEmeraldLime`, `brightHeliotrope`) se conservan por compatibilidad, pero sus valores ahora pertenecen a la paleta Rose & Gold.

---

## Comandos útiles

```powershell
flutter pub get
dart analyze
dart analyze lib test
flutter test
flutter run
```

Verificación actual del proyecto:

- `dart analyze lib test` → sin issues.
- `flutter test` → todos los tests pasan.

---

## Créditos

**Desarrollador:** RENE TURIHUANO PUMA  
**Datos:** The Movie Database (TMDB). Este producto usa la API de TMDB pero no está avalado ni certificado por TMDB.
