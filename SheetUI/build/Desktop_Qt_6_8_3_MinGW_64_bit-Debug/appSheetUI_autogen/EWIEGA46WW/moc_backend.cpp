/****************************************************************************
** Meta object code from reading C++ file 'backend.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../backend.h"
#include <QtNetwork/QSslPreSharedKeyAuthenticator>
#include <QtNetwork/QSslError>
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'backend.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.8.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN7BackendE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN7BackendE = QtMocHelpers::stringData(
    "Backend",
    "QML.Element",
    "auto",
    "exitTriggered",
    "",
    "minimizeTriggered",
    "maximizeTriggered",
    "menuTriggered",
    "redirect",
    "triggerExit",
    "triggerMinimize",
    "triggerMaximize",
    "triggerMenuItem",
    "exitApplication",
    "minimizeApplication",
    "maximizeApplication"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN7BackendE[] = {

 // content:
      12,       // revision
       0,       // classname
       1,   14, // classinfo
      11,   16, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       3,    0,   82,    4, 0x06,    1 /* Public */,
       5,    0,   83,    4, 0x06,    2 /* Public */,
       6,    0,   84,    4, 0x06,    3 /* Public */,
       7,    1,   85,    4, 0x06,    4 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       9,    0,   88,    4, 0x0a,    6 /* Public */,
      10,    0,   89,    4, 0x0a,    7 /* Public */,
      11,    0,   90,    4, 0x0a,    8 /* Public */,
      12,    1,   91,    4, 0x0a,    9 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
      13,    0,   94,    4, 0x02,   11 /* Public */,
      14,    0,   95,    4, 0x02,   12 /* Public */,
      15,    0,   96,    4, 0x02,   13 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    8,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    8,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

Q_CONSTINIT const QMetaObject Backend::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ZN7BackendE.offsetsAndSizes,
    qt_meta_data_ZN7BackendE,
    qt_static_metacall,
    nullptr,
    qt_metaTypeArray<
        // Q_OBJECT / Q_GADGET
        Backend,
        // method 'exitTriggered'
        void,
        // method 'minimizeTriggered'
        void,
        // method 'maximizeTriggered'
        void,
        // method 'menuTriggered'
        void,
        QString,
        // method 'triggerExit'
        void,
        // method 'triggerMinimize'
        void,
        // method 'triggerMaximize'
        void,
        // method 'triggerMenuItem'
        void,
        QString,
        // method 'exitApplication'
        void,
        // method 'minimizeApplication'
        void,
        // method 'maximizeApplication'
        void
    >,
    nullptr
} };

void Backend::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<Backend *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->exitTriggered(); break;
        case 1: _t->minimizeTriggered(); break;
        case 2: _t->maximizeTriggered(); break;
        case 3: _t->menuTriggered((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 4: _t->triggerExit(); break;
        case 5: _t->triggerMinimize(); break;
        case 6: _t->triggerMaximize(); break;
        case 7: _t->triggerMenuItem((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 8: _t->exitApplication(); break;
        case 9: _t->minimizeApplication(); break;
        case 10: _t->maximizeApplication(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _q_method_type = void (Backend::*)();
            if (_q_method_type _q_method = &Backend::exitTriggered; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _q_method_type = void (Backend::*)();
            if (_q_method_type _q_method = &Backend::minimizeTriggered; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _q_method_type = void (Backend::*)();
            if (_q_method_type _q_method = &Backend::maximizeTriggered; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _q_method_type = void (Backend::*)(QString );
            if (_q_method_type _q_method = &Backend::menuTriggered; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
    }
}

const QMetaObject *Backend::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Backend::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN7BackendE.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Backend::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 11;
    }
    return _id;
}

// SIGNAL 0
void Backend::exitTriggered()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Backend::minimizeTriggered()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Backend::maximizeTriggered()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Backend::menuTriggered(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_WARNING_POP
