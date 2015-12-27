module ApplicationHelper
  #yardımcı metod form gönderilmek istendiğinde hata mesajlarını göstermek için
  def show_error_message(message='Geçerli bir değer giriniz.')
    ['<small class="error">', message, '</small>'].join.html_safe #html_safe <> gibi karakterleri düzgün işlemek için
  end

  def flash_class(type)
    {notice: 'success', alert: 'info', error: 'warning'}[type]
  end
end
