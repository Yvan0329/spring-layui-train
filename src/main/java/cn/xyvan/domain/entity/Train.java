package cn.xyvan.domain.entity;

import cn.mithrandirw.tf.admin.commons.domain.IdEntity;
import lombok.Data;

import javax.persistence.Table;
import java.util.Date;

/**
 * Train
 *
 * @author yvan
 * @date 2019-03-27 15:13:23
 */
@Data
@Table(name = "t_core_train")
public class Train extends IdEntity {

    public static final String FIELD_ORDER_NO = "orderNo";

    public static final String FIELD_NAME = "name";

    public static final String FIELD_DESC = "desc";

    public static final String FIELD_SORT = "sort";

    public static final String FIELD_CHOICED = "choiced";

    public static final String FIELD_DELETED = "deleted";

    public static final String FIELD_SIDE = "side";

    public static final String FIELD_STATE = "state";

    public static final String FIELD_FLAG = "flag";

    public static final String FIELD_DATE = "date";

    public static final String FIELD_DATETIME = "datetime";

    public static final String FIELD_QUANTITY = "quantity";


    /**
     * 名称
     */

    private String name;

    /**
     * 描述
     */
    private String description;

    /**
     * 分类
     */
    private String sort;

    /**
     * 标志
     */
    private String flag;

    /**
     * 选中
     */
    private Boolean choiced;

    /**
     * 删除
     */
    private Boolean deleted;

    /**
     * 隐藏
     */
    private Boolean visible;

    /**
     * 方面
     */
    private Boolean side;

    /**
     * 状态
     */
    private Integer state;

    /**
     * 日期
     */
    private Date date;

    /**
     * 日期时间
     */
    private Date datetime;

    /**
     * 数量
     */
    private Integer quantity;

}
