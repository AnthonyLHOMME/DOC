/**
* Import the necessary Java packages
*/

import java.io.IOException;
import java.util.Scanner;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;

/**
* A Mapreduce example for Hadoop. It extracts some basic
* information from a text file derived from the DBLP dataset.
*/
public class Titles {

	/**
	* The Mapper class -- it takes a line from the input file and 
	* extracts the string before the first tab (= the author name)
	*/
	public static class TitlesMapper extends Mapper<Object, Text, Text, IntWritable> {
		private final static IntWritable one = new IntWritable(1);

		public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
			/* Open a Java scanner object to parse the line */
			Scanner line = new Scanner(value.toString());
			line.useDelimiter("\t");
			line.next(); // skip author
			String[] words = line.next().split(" "); // split title
			for (int i = 0; i < words.length; i++) {
				context.write(new Text(words[i]), one);
			}
		}
	}

	/**
	* The Reducer class -- receives pairs (author, <list of counts>)
	* and sums up the counts of publications per author
	*/
	public static class CountReducer extends Reducer<Text, IntWritable, Text, IntWritable> {
		private IntWritable result = new IntWritable();

		public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {
			/* Iterate on the list to compute the count */
			int count = 0;
			for (IntWritable val : values) {
				count += val.get();
			}

			result.set(count);
			context.write(key, result);
		}
	}
}
