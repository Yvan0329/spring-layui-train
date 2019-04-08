package cn.xyvan.mapper;

import cn.xyvan.domain.entity.Train;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.common.Mapper;

/**
 * Train Mapper
 *
 * @author yvan
 * @date 2019-03-27 00:53:13
 */
public interface TrainMapper extends Mapper<Train> {

    @Delete("delete from t_core_train where id = #{id}")
    void deleteById(Long id);

    @Select("select * from t_core_train where id = #{id}")
    Train detail(Long id);

    @Insert("insert into t_core_train(" +
            "name," +
            "created_time," +
            "updated_time," +
            "data_state," +
            "description," +
            "sort," +
            "choiced," +
            "deleted," +
            "side," +
            "state," +
            "visible," +
            "flag," +
            "date," +
            "datetime," +
            "quantity" +
            ") values (" +
            "#{name}," +
            "#{createdTime}," +
            "#{updatedTime}," +
            "#{dataState}," +
            "#{description}," +
            "#{sort}," +
            "#{choiced}," +
            "#{deleted}," +
            "#{side}," +
            "#{state}," +
            "#{visible}," +
            "#{flag}," +
            "#{date}," +
            "#{datetime}," +
            "#{quantity}" +
            ")")
    int create(Train train);

    @Update("update t_core_train set " +
            "name = #{name}," +
            "description = #{description}," +
            "sort = #{sort}," +
            "choiced = #{choiced}," +
            "deleted = #{deleted}," +
            "side = #{side}," +
            "state = #{state}," +
            "visible = #{visible}," +
            "flag = #{flag}," +
            "date = #{date}," +
            "datetime = #{datetime}," +
            "quantity = #{quantity}," +
            "updated_time = #{updatedTime} " +
            "where id = #{id}")
    void update(Train train);
}
