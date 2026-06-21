# Balto — Mobile App

App móvil Flutter para la plataforma Balto. Conecta dueños de mascotas, walkers y negocios pet care.

## Stack

- **Flutter 3.44.0** (channel stable) — Dart 3.12.0
- **Clean Architecture** — `core / data / domain / presentation`
- **State management:** Bloc / Cubit
- **WebSockets:** SignalR (`signalr_netcore`) para seguimiento GPS en tiempo real

## Arquitectura — Clean Architecture

```
lib/
│
├── core/              # transversal — sin lógica de negocio
│   ├── constants/     # colores de marca, rutas, strings
│   ├── errors/        # failure types, excepciones
│   ├── network/       # HTTP client, interceptors
│   └── utils/         # helpers genéricos
│
├── data/              # fuentes de datos
│   ├── datasources/   # API remote datasources, local cache
│   ├── models/        # DTOs / JSON serialization
│   └── repositories/  # implementación de interfaces de domain
│
├── domain/            # núcleo — sin Flutter, sin paquetes externos
│   ├── entities/      # modelos de dominio puros
│   ├── repositories/  # interfaces (contratos)
│   └── usecases/      # casos de uso por módulo
│
└── presentation/      # UI
    ├── bloc/          # Blocs y Cubits por módulo
    ├── pages/         # screens
    └── widgets/       # widgets reutilizables
```

### Regla de dependencias

```
presentation → domain ← data
       └──── core ────┘
```

`domain` no importa Flutter ni paquetes externos.

## Setup local

### Requisitos

- Flutter 3.44.0 (`flutter --version` para verificar)
- Dart 3.12.0
- Dispositivo o emulador Android/iOS

### Variables de entorno

Crear `.env.json` en la raíz del proyecto (no se commitea):

```json
{
  "API_BASE_URL": "http://TU_VPS_IP/api",
  "SIGNALR_HUB_URL": "http://TU_VPS_IP/hubs"
}
```

### Correr

```bash
flutter run --dart-define-from-file=.env.json
```

### Build release

```bash
flutter build apk --dart-define-from-file=.env.json
flutter build ios --dart-define-from-file=.env.json
```

## Paquetes

| Paquete | Uso |
|---------|-----|
| `flutter_bloc` | Maneja el estado de la app |
| `dio` | Hace las peticiones HTTP al backend |
| `flutter_secure_storage` | Guarda los tokens en el dispositivo |
| `go_router` | Navegación entre pantallas |
| `get_it` | Conecta las dependencias entre capas |
| `equatable` | Evita que la app se redibuje cuando nada cambió |
| `signalr_netcore` | Conexión en tiempo real con el backend (GPS) |
| `json_serializable` + `build_runner` | Convierte JSON a modelos y viceversa |

## Flujo de ramas

```
feature/* → dev → staging → main
```

- `feature/*` siempre sale de `dev`
- Nunca commitear directo a `main` o `staging`
- Merge a `main` solo cuando `staging` está validado

## Convenciones de API

- Base: `/api/{recurso}` — sin versionado
- Casing: `kebab-case` → `/api/walking-history`
- Relaciones directas: recursos anidados → `/api/users/{id}/pets`
- Auth: JWT — `access_token` en header `Authorization: Bearer`, ambos tokens en `flutter_secure_storage`

## Colores de marca

| Módulo | Hex |
|--------|-----|
| Core Brand / Dueños & Comunidad | `#607F7F` |
| AI-Coach | `#5F36C2` |
| Dashboard & Analytics | `#3A80C2` |
| Pet Profile | `#1BAA71` |
| Alert & Notificaciones | `#D05A24` |

## Módulos (64 casos de uso)

| Módulo | Estado |
|--------|--------|
| Gestión de usuarios y acceso (UC-01–08) | Pendiente |
| Perfil del perro (UC-09–14) | Pendiente |
| Walk Planner (UC-15–20) | Pendiente |
| Walker Hub (UC-21–27) | Pendiente |
| Matching y recomendaciones (UC-28–31) | Pendiente |
| Reserva y gestión del servicio (UC-32–38) | Pendiente |
| Seguimiento en tiempo real / GPS (UC-39–44) | Pendiente |
| Alertas perros perdidos/encontrados (UC-45–49) | Pendiente |
| AI Coach (UC-50–55) | Pendiente |
| Dashboard de actividad (UC-56–58) | Pendiente |
| Reputación y calificaciones (UC-59–61) | Pendiente |
| Administración (UC-62–64) | Pendiente |
