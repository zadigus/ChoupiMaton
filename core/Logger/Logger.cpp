#include "Logger.hpp"

#include "core/Utils.hpp"

#include "common/ConfigHelpers.hpp"

#include <QDate>

namespace N_Logger {

  //----------------------------------------------------------------------------------------------
  void resetLogFile()
  {
    QFile logFile(N_Common::logFilename());
    if(!logFile.exists())
    {
      logFile.open(QIODevice::WriteOnly | QIODevice::Text);
      logFile.close();
    }
  }

  //----------------------------------------------------------------------------------------------
  void message(QtMsgType a_MsgType, const QMessageLogContext& a_Context, const QString& a_Msg)
  {
    QByteArray localMsg(a_Msg.toLocal8Bit());

    QStringList msg;

    switch(a_MsgType)
    {
     case QtDebugMsg:
        msg << "[DBG]";
        break;
      case QtWarningMsg:
        msg << "[WRN]";
        break;
      case QtCriticalMsg:
        msg << "[CRT]";
        break;
      case QtFatalMsg:
        msg << "[FTL]";
        break;
      case QtInfoMsg:
        msg << "[INF]";
        break;
    }

    msg << coreMessage(a_Context);
    msg << localMsg.constData();

    N_Utils::writeTextToFile(N_Common::logFilename(), QIODevice::Append, msg.join(" "));
  }

  //----------------------------------------------------------------------------------------------
  QString coreMessage(const QMessageLogContext& a_Context)
  {
    QStringList result;
    result << "[";
    result << QDateTime::currentDateTime().toString();
    result << "]";

    result << "[";
    result << a_Context.function;
    result << "]";

    return result.join(" ");
  }

}
