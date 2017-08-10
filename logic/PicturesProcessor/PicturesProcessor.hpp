#ifndef PICTURESPROCESSOR_PICTURESPROCESSOR_HPP
#define PICTURESPROCESSOR_PICTURESPROCESSOR_HPP

#include <QObject>

namespace N_PicturesProcessor {

  /*
   * The purpose of this class is to process
   * the pictures taken with the camera. It
   * essentially is responsible for saving
   * and printing them
   */

  class PicturesProcessor : public QObject
  {
      Q_OBJECT

    public:
      PicturesProcessor(QObject* a_Parent = Q_NULLPTR);
      virtual ~PicturesProcessor();

      Q_INVOKABLE void process(const QString& a_Path);

    private:
      Q_DISABLE_COPY(PicturesProcessor)
  };

}

#endif // PICTURESPROCESSOR_PICTURESPROCESSOR_HPP
