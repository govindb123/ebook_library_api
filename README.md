# 📚 Digital Ebook Library

A full-stack Digital Ebook Library application built using **Ruby on Rails API** and **React (Vite)**. Users can upload, manage, search, read, and download ebooks through a modern 3D glassmorphism UI.

---

## 🚀 Project Overview

The Digital Ebook Library is a complete ebook management system. Users can:

* Upload PDF / EPUB ebooks (up to 25MB)
* View all uploaded ebooks in a card grid
* Search ebooks by title, author, or filename
* Read ebooks inline in the browser (PDF viewer)
* Download ebooks directly to their device
* Delete ebooks with confirmation
* Experience loading, empty, and error states

---

## 🛠 Tech Stack

### Backend

| Technology | Version |
|---|---|
| Ruby | 3.2.1 |
| Ruby on Rails | 7.1.6 |
| PostgreSQL | Latest |
| Active Storage | Built-in |
| Puma | >= 5.0 |
| Rack CORS | Latest |
| RSpec Rails | Latest |
| FactoryBot Rails | Latest |
| Faker | Latest |

### Frontend

| Technology | Version |
|---|---|
| React | 19.x |
| Vite | 8.x |
| React Router DOM | 7.x |
| Axios | 1.x |
| Tailwind CSS | 4.x |
| React Hook Form | 7.x |
| React Hot Toast | 2.x |

---

## 📁 Project Structure

```
ebook-library/
│
├── ebook_library_api/               # Rails API Backend
│   ├── app/
│   │   ├── controllers/
│   │   │   └── api/v1/
│   │   │       └── ebooks_controller.rb
│   │   ├── models/
│   │   │   └── ebook.rb
│   │   └── serializers/
│   │       └── ebook_serializer.rb
│   ├── config/
│   │   └── routes.rb
│   ├── db/
│   │   └── schema.rb
│   └── spec/
│       ├── factories/
│       │   └── ebooks.rb
│       ├── fixtures/files/
│       │   └── sample.pdf
│       └── requests/
│           └── ebooks_spec.rb
│
└── ebook-frontend/                  # React Frontend
    ├── src/
    │   ├── api/
    │   │   ├── axios.js
    │   │   └── ebookApi.js
    │   ├── assets/
    │   │   └── hero.png
    │   ├── components/
    │   │   ├── BookCard.jsx / .css
    │   │   ├── EmptyState.jsx
    │   │   ├── Loader.jsx
    │   │   ├── SearchBar.jsx / .css
    │   │   └── UploadModal.jsx / .css
    │   ├── pages/
    │   │   ├── Library.jsx / .css
    │   │   └── Reader.jsx / .css
    │   ├── App.jsx
    │   ├── index.css
    │   └── main.jsx
    ├── package.json
    └── vite.config.js
```

---

## ✨ Features

### Backend

* RESTful API with versioning (`/api/v1`)
* Ebook upload with Active Storage
* File validation — PDF and EPUB only, max 25MB
* Ebook listing with file metadata via custom serializer
* Single ebook fetch
* Full-text search by title, author, filename (case-insensitive)
* File download via Active Storage blob redirect
* Ebook delete with file cleanup
* JSON responses with consistent structure
* CORS configured via Rack CORS
* RSpec request specs with FactoryBot and Faker

### Frontend

* Dark glassmorphism UI with 3D card tilt effect
* Hero banner background image
* Gradient page title
* Book cards with unique color themes per book (6 themes)
* Inline PDF reader using Blob URL (bypasses X-Frame-Options)
* Auto file download using Blob URL
* Search bar with live filtering
* Upload form with title, author, PDF file picker
* Loading spinner state
* Empty library state
* Responsive layout

------------------------------------------------

## 📌 API Endpoints

### Get All Ebooks

GET /api/v1/ebooks


### Upload Ebook

POST /api/v1/ebooks

Form Data:

title     (required)
author    (required)
file      (required - PDF or EPUB, max 25MB)
cover     (optional)


### Get Single Ebook

GET /api/v1/ebooks/:id


### Search Ebooks

GET /api/v1/ebooks/search?q=keyword

Searches by title, author, or filename (case-insensitive).

### Download Ebook

GET /api/v1/ebooks/:id/download

### Delete Ebook

DELETE /api/v1/ebooks/:id


--------------------------------------------------------------------------

## 🗄 Database Schema

### ebooks table

| Column     | Type     |
|----------  |----- --  |
| id         | bigint   |
| title      | string   |
| author     | string   |
| created_at | datetime |
| updated_at | datetime |

### Active Storage Tables

* `active_storage_blobs` — stores file metadata
* `active_storage_attachments` — polymorphic join table
* `active_storage_variant_records` — image variants

### Attachments per Ebook

* file — required (PDF or EPUB)
* cover — optional (cover image)

----------------------------------------------------------------------------

## ⚙ Backend Setup

Clone the repository:

bash
git clone https://github.com/govindb123/ebook_library_api
cd ebook_library_api


Install dependencies:
 bash
bundle install


Create and migrate database:
```bash
rails db:create
rails db:migrate
```

Install Active Storage:
```bash
rails active_storage:install
rails db:migrate
```

Start server:
```bash
rails server
```

Backend runs on:
```
http://localhost:3000
```

--------------------------------------------------------------------

## 💻 Frontend Setup

Clone the repository:

bash
git clone https://github.com/govindb123/ebook-frontend

```bash
cd ebook-frontend
npm install
npm run dev
```

Frontend runs on:
```
http://localhost:5173
```

-------------------------------------------------------------------------

## 🧪 Running Tests

```bash
cd ebook_library_api
bundle exec rspec
```

Test coverage includes:
* GET /api/v1/ebooks — list all ebooks
* POST /api/v1/ebooks — upload ebook
* GET /api/v1/ebooks/:id — fetch single ebook
* GET /api/v1/ebooks/search — search ebooks
* GET /api/v1/ebooks/:id/download — download ebook
* DELETE /api/v1/ebooks/:id — delete ebook
* Validation errors (missing file, invalid file type)

-----------------------------------------------------------------------

## 📝 Manual Testing Checklist

* Upload a PDF ebook
* Upload an EPUB ebook
* Upload file > 25MB (should fail validation)
* Upload invalid file type (should fail validation)
* View uploaded ebooks grid
* Search by title
* Search by author
* Search by filename
* Read ebook inline (PDF viewer)
* Download ebook to device
* Delete ebook with confirmation
* Empty library state
* Loading state

------------------------------------------------------------------------------

## 🎨 UI Design

* Glassmorphism cards with `backdrop-filter: blur`
* 3D card tilt effect on mouse move using CSS `perspective` + `rotateX/Y`
* 6 unique color themes per book card (purple, cyan, amber, green, pink, red)
* Gradient hero title
* Hero banner background image
* Consistent input styles across search and upload forms
* Inline PDF reader using Blob URL to bypass `X-Frame-Options`

------------------------------------------------------------------------------


## 🚀 Future Enhancements

* User Authentication (Devise / JWT)
* EPUB inline reader
* Cover image display on cards
* Pagination
* Sorting and filtering
* Bookshelf-style UI
* Last read position tracking
* Docker support
* Cloud Storage (AWS S3)
* Role-Based Access Control

------------------------------------------------------------------------------

## 🤖 AI Tools Used

* **Claude** — Used as development assistant for architecture planning, debugging, and code optimization
* **ChatGPT** — Used for initial project scaffolding and guidance

All generated code was manually reviewed, integrated, tested, and modified where necessary.

---

## 📋 Assignment Requirements Covered

* Ruby on Rails API ✅
* React Frontend ✅
* Ebook Upload ✅
* Ebook Listing ✅
* Ebook Search ✅
* Ebook Reading (inline PDF) ✅
* Ebook Download ✅
* Ebook Delete ✅
* Active Storage ✅
* File Validation (type + size) ✅
* API Error Handling ✅
* Custom Serializer ✅
* Backend Testing (RSpec) ✅
* AI Usage Documentation ✅
* Professional Documentation ✅

---

## 👨‍💻 Author

**Govind Birajdar**

Ruby on Rails & Full Stack Developer
