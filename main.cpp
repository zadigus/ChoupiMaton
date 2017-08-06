#include <QGuiApplication>
#include <QQuickView>
#include <QQmlEngine>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc,argv);
    // TODO: use QQmlApplicationEngine
    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    // Qt.quit() called in embedded .qml by default only emits
    // quit() signal, so do this (optionally use Qt.exit()).
    QObject::connect(view.engine(), SIGNAL(quit()), qApp, SLOT(quit()));
    view.setSource(QUrl("qrc:/qml/PicturesTaker.qml"));
    view.resize(800, 480);
    view.show();
    return app.exec();
}
