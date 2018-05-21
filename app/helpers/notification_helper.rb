module NotificationHelper
  FLASH_TYPES = {
    'success' => 'alert-success',
    'error' => 'alert-danger',
    'alert' => 'alert-warning',
    'notice' => 'alert-info'
  }.freeze

  def bootstrap_class_for_flash(flash_type)
    FLASH_TYPES[flash_type] || flash_type.to_s
  end
end
