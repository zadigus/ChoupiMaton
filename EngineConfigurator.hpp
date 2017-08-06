#ifndef ENGINECONFIGURATOR_HPP
#define ENGINECONFIGURATOR_HPP

class QQmlApplicationEngine;
class QUrl;

class EngineConfigurator
{
  public:
    EngineConfigurator(QQmlApplicationEngine& a_Engine);

    void loadQml(const QUrl& a_Path);

  private:
    QQmlApplicationEngine& m_Engine;
};

#endif // ENGINECONFIGURATOR_HPP
