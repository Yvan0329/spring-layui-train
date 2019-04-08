package cn.xyvan.domain.vo;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.util.Date;

/**
 * Train VO
 *
 * @author yvan
 * @date 2019-03-27 15:13:24
 */
@Data
public class TrainVo {

    /**
     * 主键
     */
    private Long id;

    /**
     * 创建时间
     */
    private Date createdTime;

    /**
     * 最后更新时间
     */
    private Date updatedTime;

    /**
     * 数据状态
     */
    private String dataState;

    /**
     * 序号
     */
    private String orderNo;

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
     * 选中
     */
    private Boolean choiced;

    /**
     * 删除
     */
    private Boolean deleted;

    /**
     * 方面
     */
    private Boolean side;

    private Boolean visible;

    /**
     * 状态
     */
    private Integer state;

    /**
     * 标志
     */
    private String flag;

    /**
     * 日期
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date date;

    /**
     * 日期时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date datetime;

    /**
     * 数量
     */
    private Integer quantity;


}
