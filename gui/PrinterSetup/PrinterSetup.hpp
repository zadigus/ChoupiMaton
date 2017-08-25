#include <QQuickItem>

#include "Global.hpp"

//class QQuickWindow;

namespace N_PrinterSetup {

//  class PrinterData;

  class PrinterSetup : public QQuickItem
  {
    public:
      PrinterSetup(QQuickItem* a_Parent = Q_NULLPTR);
      virtual ~PrinterSetup();

    private slots:
      void onWindowChanged(QQuickWindow* a_Window);

    private:
//      std::shared_ptr<PrinterData> m_Data;
  };

}
