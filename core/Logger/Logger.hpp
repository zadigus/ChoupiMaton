#ifndef LOGGER_HPP
#define LOGGER_HPP

#include <QtGlobal>

class QMessageLogContext;
class QString;

namespace N_Logger {

  void resetLogFile();
  void message(QtMsgType a_MsgType, const QMessageLogContext& a_Context, const QString& a_Msg);
  QString coreMessage(const QMessageLogContext& a_Context);

}

#endif
