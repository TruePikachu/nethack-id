(in-package :nethack-id)
(declaim (optimize debug safety))

(defgeneric enchantable-item-enchantable-p (enchantable-item)
  (:documentation
    "T/NIL if ENCHANTABLE-ITEM's instance can be enchanted"))
(defgeneric item-appearance (item)
  (:documentation
    "If ITEM has a guaranteed appearance, get it"))
(defgeneric item-name (item)
  (:documentation
    "Get the name of ITEM"))
(defgeneric price-id-cost (price-id-item)
  (:documentation
    "Get the base cost of PRICE-ID-ITEM"))

;;;; Root class
(defclass item ()
  ((name :initarg :name
         :reader item-name
         :type keyword)
   (appearance :initarg :appearance
               :reader item-appearance
               :type (or keyword null)))
  (:documentation
    "Root class for item identities"))

(defmethod print-object ((this item) stream)
  (print-unreadable-object (this stream :type t)
    (princ (item-name this) stream)))

;;;; Subclasses for identification methods common to multiple item classes
(defclass enchantable-item (item)
  ((enchantable-p :initarg :enchantable
                  :initform t
                  :reader enchantable-item-enchantable-p
                  :type boolean))
  (:documentation
    "Subclass for item types which can have enchantments"))

(defclass price-id-item (item)
  ((cost :initarg :cost
         :reader price-id-cost
         :type fixnum))
  (:documentation
    "Subclass for item types with reliable price-ID characteristics"))

;;;; Item classes
(defclass amulet (item)
  ())

(defclass book (price-id-item)
  ())

(defclass potion (price-id-item)
  ())

(defclass ring (enchantable-item price-id-item)
  ((enchantable-p :initform nil)))

(defclass scroll (price-id-item)
  ())

(defclass wand (price-id-item)
  ())
